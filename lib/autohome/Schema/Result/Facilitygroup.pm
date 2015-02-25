use utf8;
package autohome::Schema::Result::Facilitygroup;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

autohome::Schema::Result::Facilitygroup

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<facilitygroup>

=cut

__PACKAGE__->table("facilitygroup");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 45 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07025 @ 2012-12-30 07:58:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6NGMqL86rOpNaTX/0wWFSg


__PACKAGE__->belongs_to( 'facilitygroups' => 'autohome::Schema::Result::FacilitiesToFacilitygroup', { 'foreign.facilitygroup_id' => 'self.id' } );
__PACKAGE__->belongs_to( 'schedule' => 'autohome::Schema::Result::Schedule', { 'foreign.facilitygroup_id' => 'self.id' } );
# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
