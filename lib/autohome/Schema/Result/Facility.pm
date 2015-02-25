use utf8;
package autohome::Schema::Result::Facility;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

autohome::Schema::Result::Facility

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<facilities>

=cut

__PACKAGE__->table("facilities");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 manual

  data_type: 'enum'
  default_value: 'none'
  extra: {list => ["none","off","on"]}
  is_nullable: 0

=head2 controller_id

  data_type: 'integer'
  default_value: -1
  is_nullable: 0

=head2 digital_pin

  data_type: 'integer'
  default_value: -1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "manual",
  {
    data_type => "enum",
    default_value => "none",
    extra => { list => ["none", "off", "on"] },
    is_nullable => 0,
  },
  "controller_id",
  { data_type => "integer", default_value => -1, is_nullable => 0 },
  "digital_pin",
  { data_type => "integer", default_value => -1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-12-21 23:59:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3jBCIKgTtV4YYY0Q9rlV9g


__PACKAGE__->belongs_to( 'facilities' => 'autohome::Schema::Result::FacilitiesToFacilitygroup', { 'foreign.facility_id' => 'self.id' } );
__PACKAGE__->belongs_to( 'controller' => 'autohome::Schema::Result::Controller', { 'foreign.id' => 'self.controller_id' } );
# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
