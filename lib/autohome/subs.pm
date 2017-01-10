package autohome::subs;
use Data::Dumper;
use autohome::Schema;

#my $dbi_dsn = "dbi:mysql:autohome:prd002.mallard.au";
my $dbi_dsn = "dbi:mysql:autohome:localhost";
my $user = "matt";
#my $pass = "u95Vj8q8mtcjV54M";
my $pass = "nYBbSCQp9ajRTSWV";
my %dbi_params;

my $schema = autohome::Schema->connect($dbi_dsn, $user, $pass, \%dbi_params);

sub get_schedule_info {
    my @schedules;
    my $rs = $schema->resultset('Schedule')->search_rs( { 1 => 1 },{ prefetch => [ 'facilitygroups' ] });
    while (my $schedule = $rs->next) {
        my %data;
        for my $col ( $rs->result_source->columns ){
            #debug "column: " . $col;
            $data{$col} = $schedule->$col;
        }
        push @schedules, \%data;
    }
    my @groups;
    $rs = $schema->resultset('Facilitygroup');
    while (my $group = $rs->next) {
        push @groups, { name => $group->name };
    }
    return ( \@schedules, \@groups );
}

sub tc(){
    for( @_ ){
        s/(\w\S*)/\u\L$1/g;
    }
    return @_;
}

true;
