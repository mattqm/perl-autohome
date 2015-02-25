package autohome;
use Dancer2;
use Dancer2::Plugin::DBIC qw(schema resultset rset);
#use Dancer2::Plugin::Ajax;
#use autohome::subs;
#use autohome::API;
use Data::Dumper;

our $VERSION = '0.1';

my $year = (localtime(time))[5] + 1900;

hook 'before' => sub { 
#if( $ENV{'SERVER_NAME'} =~ /^autohomedev/ ){
    #set 'environment' => 'development';
#} else {
    #set 'environment' => 'production';
#}
#debug "Running in the ".config->{environment}." environment";

    my $context = shift;
    var year => $year;
    var cright => '<p class="plain_link" >&copy; '.$year.' <a href="http://Q-Technologies.com.au/" data-role="none" class="plain_link" rel="external">Q-Technologies</a></p>';
    if( request->path_info =~ /(\/\w+)\&/ ){
        debug "Changed URL to $1";
        $context->response( forward($1) );
        $context->response->halt;
    }


};

hook before_template => sub {
	my $tokens = shift;
	
	#$tokens->{'css_url'} = request->base . 'css/style.css';
	$tokens->{'scheds_url'} = uri_for('/schedules');
	$tokens->{'falgroups_url'} = uri_for('/groups');
	$tokens->{'fals_url'} = uri_for('/facilities');
	$tokens->{'index_url'} = uri_for('/');
};

get '/' => sub {
    template 'index', { 
        type => 'Index', 
        heading => 'Autohome', 
        login_btn => '<a href="#dialog-login" data-role="button" data-mini="true" data-icon="star" id="logInButton" class="ui-btn-right">Login</a>',
        logout_btn => '<a href="#" data-role="button" data-mini="true" data-icon="star" id="logOutButton" class="ui-btn-right">Logout</a>',
    };
};

sub get_schedule_info {
    my @schedules;
    my $rs = schema->resultset('Schedule')->search_rs( { 1 => 1 },{ prefetch => [ 'facilitygroups' ] });
    while (my $schedule = $rs->next) {
        my %data;
        for my $col ( $rs->result_source->columns ){
            #debug "column: " . $col;
            $data{$col} = $schedule->$col;
        }
        push @schedules, \%data;
    }
    my @groups;
    $rs = schema->resultset('Facilitygroup');
    while (my $group = $rs->next) {
        push @groups, { name => $group->name };
    }
    return ( \@schedules, \@groups );
}

get '/schedules' => sub {
    my @schedules = schema->resultset('Schedule')->search_rs( { 1 => 1 },{ prefetch => [ 'facilitygroups' ] })->all;
    my @groups = schema->resultset('Facilitygroup')->all;
    my @minutes = ( 1..20, 25, 30, 35, 40, 45, 50, 60, 75, 90, 120, 180, 240, 360, 420, 480, 540, 600, 660, 720, 900, 1080, 1260, 1440 );
    my $defaults = { id => 99999999, name => 'New Schedule', time_of_day => '05:00:00', duration => 5 };
            debug Dumper( session );
    template 'schedules.tt', {
        type => 'Schedule',
        heading => 'Schedules',
        groups => \@groups,
        schedules => \@schedules,
        minutes => \@minutes,
        defaults => $defaults,
    };
};

get '/groups' => sub {
    my @groups = schema->resultset('Facilitygroup')->all;
    my @f2groups = schema->resultset('FacilitiesToFacilitygroup')->all;
    my @facilities = schema->resultset('Facility')->all;
    my $defaults = { id => 99999999, name => 'New Facility Group', time_of_day => '05:00:00', duration => 5 };
    template 'groups.tt', { 
        type => 'Facilitygroup', 
        heading => 'Facility Groups', 
        groups => \@groups, 
        facilities => \@facilities, 
        f2groups => \@f2groups, 
        defaults => $defaults,
    };
};

get '/facilities' => sub {
    my @facilities = schema->resultset('Facility')->search_rs( { 1 => 1 },{ prefetch => [ 'controller' ] })->all;
    my @controllers = schema->resultset('Controller')->all;
    my $def_ctlr = schema->resultset('Controller')->find( {default => 1} );
    my $defaults = { id => 99999999, name => 'New Facility', controller_id => $def_ctlr->id, num_digital_pins => $def_ctlr->num_digital_pins };
    template 'facilities.tt', { 
        type => 'Facility', 
        heading => 'Facilities', 
        facilities => \@facilities, 
        controllers => \@controllers, 
        defaults => $defaults,
    };
};

true;
