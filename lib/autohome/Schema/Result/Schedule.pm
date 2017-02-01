use utf8;
package autohome::Schema::Result::Schedule;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

autohome::Schema::Result::Schedule

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<schedules>

=cut

__PACKAGE__->table("schedules");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 facilitygroup_id

  data_type: 'integer'
  is_nullable: 0

=head2 time_of_day

  data_type: 'time'
  default_value: '00:00:00'
  is_nullable: 1

=head2 duration

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

minutes

=head2 skip_days

  data_type: 'integer'
  default_value: 1
  is_nullable: 1

=head2 last_run

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 active

  data_type: 'integer'
  default_value: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "facilitygroup_id",
  { data_type => "integer", is_nullable => 0 },
  "time_of_day",
  { data_type => "time", default_value => "00:00:00", is_nullable => 1 },
  "duration",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "skip_days",
  { data_type => "integer", default_value => 1, is_nullable => 1 },
  "last_run",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "active",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2017-02-02 10:57:18
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ehSy54fbaGd0dzykSWBJjw


__PACKAGE__->has_many( 'facilitygroups' => 'autohome::Schema::Result::Facilitygroup', 'id' );
# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
