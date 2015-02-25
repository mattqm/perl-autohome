use utf8;
package autohome::Schema::Result::DigitalSensor;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

autohome::Schema::Result::DigitalSensor

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<digital_sensors>

=cut

__PACKAGE__->table("digital_sensors");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 type

  data_type: 'enum'
  extra: {list => ["distance"]}
  is_nullable: 0

=head2 controller_id

  data_type: 'integer'
  is_nullable: 0

=head2 digital_pins

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 active

  data_type: 'enum'
  extra: {list => ["yes","no"]}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "type",
  {
    data_type => "enum",
    extra => { list => ["distance"] },
    is_nullable => 0,
  },
  "controller_id",
  { data_type => "integer", is_nullable => 0 },
  "digital_pins",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "active",
  {
    data_type => "enum",
    extra => { list => ["yes", "no"] },
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07025 @ 2012-12-30 07:53:51
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:r6bu0ECE4H13q6sogzy3+A

__PACKAGE__->belongs_to( 'controller' => 'autohome::Schema::Result::Controller', { 'foreign.id' => 'self.controller_id' } );

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
