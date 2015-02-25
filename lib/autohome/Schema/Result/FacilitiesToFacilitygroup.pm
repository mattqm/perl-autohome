use utf8;
package autohome::Schema::Result::FacilitiesToFacilitygroup;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

autohome::Schema::Result::FacilitiesToFacilitygroup

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<facilities_to_facilitygroup>

=cut

__PACKAGE__->table("facilities_to_facilitygroup");

=head1 ACCESSORS

=head2 id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0

=head2 facilitygroup_id

  data_type: 'integer'
  is_nullable: 0

=head2 facility_id

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "bigint", is_auto_increment => 1, is_nullable => 0 },
  "facilitygroup_id",
  { data_type => "integer", is_nullable => 0 },
  "facility_id",
  { data_type => "integer", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-12-21 23:59:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Xe0zknGQdoKgqNsfkVmPHA


__PACKAGE__->set_primary_key(__PACKAGE__->columns);
__PACKAGE__->has_many( 'facilities' => 'autohome::Schema::Result::Facility', { 'foreign.id' => 'self.facility_id' } );
__PACKAGE__->has_many( 'facilitygroups' => 'autohome::Schema::Result::Facilitygroup', { 'foreign.id' => 'self.facilitygroup_id' } );
# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
