package autohome::API;

use Data::Dumper;
#use Dancer2 appname => 'autohome';
use Dancer2;
use Dancer2::Plugin::Ajax;
use Dancer2::Plugin::DBIC qw(schema resultset rset);
use autohome::Schema;
use autohome::subs;

set serializer => 'JSON';

my $sched_defaults = { id => 99999999, name => 'New Schedule', time_of_day => '05:00:00', duration => 5 };
my @minutes = ( 1..20, 25, 30, 35, 40, 45, 50, 60, 75, 90, 120, 180, 240, 360, 420, 480, 540, 600, 660, 720, 900, 1080, 1260, 1440 );

ajax '/logout' => sub {
    debug context->destroy_session;
    { result => 'success' };
};

ajax '/login' => sub {
    my $user = param "user";
    my $pass = param "pass";
    if( $user eq setting('user1') and $pass eq setting('pass1') ){
        session 'role' => 'admin';
        session 'logged_in' => true;
        { result => 'success' };
    } elsif( $user eq setting('user2') and $pass eq setting('pass2') ){
        session 'role' => 'user';
        session 'logged_in' => true;
        { result => 'success' };
    } else {
        { result => 'failed' };
    }
};

ajax '/delete/*' => sub {
    my ($type) = splat;
    if( session 'logged_in' and session('role') eq "admin" ){
        my $id = param "id";
        my $rs = schema->resultset(tc($type))->find({ id => $id });
        if( $rs ){
            $rs->delete;
            { result => 'success' };
        } else {
            send_error("error removing $type", 400);
        }
    } else {
        send_error("error creating new $type", 403);
    }
};
ajax '/getlist/*' => sub {
    my ($type) = splat;
    my $options = {};
    #if( session 'logged_in' and session('role') eq "admin" ){
        debug "Logged in as admin - getting $type list";
        if( $type eq "schedules" ){
            #my @schedules = schema->resultset('Schedule')->search_rs( { 1 => 1 },{ prefetch => [ 'facilitygroups' ] })->all;
            #my @groups = schema->resultset('Facilitygroup')->all;
            my ( $schedules, $groups ) = autohome::subs::get_schedule_info();
            #my ( $schedules, $groups ) = ();
            #{ result => { minutes => \@minutes, defaults => $sched_defaults } };
            debug Dumper( $schedules );
            { result => { schedules => $schedules, groups => $groups, minutes => \@minutes, defaults => $sched_defaults } };
        } else {
            send_error("error finding $type", 400);
        }
    #} else {
        #send_error("you need to login", 403);
    #}
};
ajax '/add/*' => sub {
    my ($type) = splat;
    my $options = {};
    if( $type eq "facility" ){
        $options = { manual => 'none' };
    }
    if( session 'logged_in' and session('role') eq "admin" ){
        my $rs = schema->resultset(tc($type))->create( $options );
        if( $rs ){
            debug "Created a new row with ID:".$rs->id;
            { result => $rs->id };
        } else {
            send_error("error creating new $type", 400);
        }
    } else {
        send_error("error creating new $type", 403);
    }
};
ajax '/update/facility' => sub {
    my $type = param "type";
    my $id = param "id";
    my $mode = param "mode";
    my $ctlr = param "ctlr";
    my $name = param "name";
    my $dpin = param "dpin";
    debug "got TYPE:$type, ID:$id, MODE:$mode, CONTROLLER_ID:$ctlr, NAME:$name, PIN:$dpin";
    if( session 'logged_in' ){
        #if( $mode eq "auto" );
        my $rs = schema->resultset($type)->find({ id => $id });
        if( $rs ){
            $rs->manual($mode);
            #$rs->manual('mode');
            if( session('role') eq "admin" ){
                $rs->name($name);
                $rs->digital_pin($dpin);
                $rs->controller_id($ctlr);
            }
            debug "Logged in with role:". session 'role';
            eval { $rs->update };
            if( $@ ){
                my @err = split /\n/, $@;
                debug "######".$err[0]."######";
                send_error("error updating data", 400);
            } else {
                { result => 'success' };
            }
        } else {
            send_error("error finding data to update", 400);
        }
    } else {
        send_error("error creating new $type", 403);
    }
};

ajax '/update/facilitygroup' => sub {
    my $type = param "type";
    my $id = param "id";
    my $fals = param "fals";
    my $name = param "name";
    debug "got TYPE:$type, ID:$id, NAME:$name, FACILITIES:$fals";
    my @fals = split( /:/, $fals);
    my @facilities;
    for( @fals ){
        m/-(\d+)-(\d+)/;
        push @facilities, $1 if defined $1;
    }
    my $result;
    debug Dumper( \@facilities );
    if( session 'logged_in' and session('role') eq "admin" ){
        my $rs = schema->resultset($type)->find({ id => $id });
        if( $rs ){
            if( session('role') eq "admin" ){
                $rs->name($name);
            }
            debug "Logged in with role:". session 'role';
            eval { $rs->update };
            if( $@ ){
                my @err = split /\n/, $@;
                debug "######".$err[0]."######";
                send_error("error updating data", 400);
            } else {
                $result = 'success';
            }
        } else {
            send_error("error finding data to update", 400);
        }
        debug "Logged in with role:". session 'role';
        my $rs2 = schema->resultset('FacilitiesToFacilitygroup')->search({ facilitygroup_id => $id });
        if( $rs2 ){
            $rs2->delete();
            $result = 'success';
        } else {
            send_error("error finding data to update", 400);
        }
        my $rs3 = schema->resultset('FacilitiesToFacilitygroup');
        if( $rs3 ){
            for( @facilities ){
                $rs3->create( { facilitygroup_id => $id, facility_id => $_ });
            }
            $result = 'success';
        } else {
            send_error("error finding data to update", 400);
        }
        if( $result eq "success" ){
            { result => 'success' };
        } else {
            debug "we're here";
            send_error("error finding data to update", 400);
        }
    } else {
        send_error("error creating new $type", 403);
    }
};

ajax '/update/schedule' => sub {
    my $type = param "type";
    my $id = param "id";
    my $grp = param "grp";
    my $actv = param "actv";
    my $time = param "time";
    my $skip = param "skip";
    my $durn = param "durn";
    my $name = param "name";
    debug "got TYPE:$type, ID:$id, GROUP:$grp, ACTIVE:$actv, NAME:$name, DURATION:$durn, SKIP_DAYS:$skip, TIME:$time";
    if( session 'logged_in' ){
        #if( $mode eq "auto" );
        my $rs = schema->resultset($type)->find({ id => $id });
        if( $rs ){
            if( session('role') eq "admin" ){
                $rs->name($name);
                $rs->facilitygroup_id($grp);
                $rs->time_of_day($time);
                $rs->duration($durn);
                $rs->skip_days($skip - 1);
                $rs->active($actv);
            }
            debug "Logged in with role:". session 'role';
            eval { $rs->update };
            if( $@ ){
                my @err = split /\n/, $@;
                debug "######".$err[0]."######";
                send_error("error updating data", 400);
            } else {
                { result => 'success' };
            }
        } else {
            send_error("error finding data to update", 400);
        }
    } else {
        send_error("error creating new $type", 403);
    }
};


true;
