use utf8;
package autohome::Schema::Result::AnalogSensor;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

autohome::Schema::Result::AnalogSensor

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<analog_sensors>

=cut

__PACKAGE__->table("analog_sensors");

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
  extra: {list => ["temp_c","temp_f","light"]}
  is_nullable: 0

=head2 controller_id

  data_type: 'integer'
  is_nullable: 0

=head2 analog_pin

  data_type: 'integer'
  default_value: 1
  is_nullable: 0

=head2 active

  data_type: 'enum'
  default_value: 'yes'
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
    extra => { list => ["temp_c", "temp_f", "light"] },
    is_nullable => 0,
  },
  "controller_id",
  { data_type => "integer", is_nullable => 0 },
  "analog_pin",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
  "active",
  {
    data_type => "enum",
    default_value => "yes",
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:xCHxSXyVm1+WCuAvYicmTw

__PACKAGE__->belongs_to( 'controller' => 'autohome::Schema::Result::Controller', { 'foreign.id' => 'self.controller_id' } );

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
