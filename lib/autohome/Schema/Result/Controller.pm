use utf8;
package autohome::Schema::Result::Controller;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

autohome::Schema::Result::Controller

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<controllers>

=cut

__PACKAGE__->table("controllers");

=head1 ACCESSORS

=head2 id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 num_digital_pins

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 num_analog_pins

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 type

  data_type: 'enum'
  extra: {list => ["arduino_serial","rpi_serial"]}
  is_nullable: 0

=head2 hostname

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 device

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 default

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "bigint", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "num_digital_pins",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "num_analog_pins",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "type",
  {
    data_type => "enum",
    extra => { list => ["arduino_serial", "rpi_serial"] },
    is_nullable => 0,
  },
  "hostname",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "device",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "default",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07024 @ 2013-10-03 20:22:07
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:RWE1qUib5zhQki17jXFshg


__PACKAGE__->has_many( 'facility' => 'autohome::Schema::Result::Facility', { 'foreign.controller_id' => 'self.id' } );
__PACKAGE__->has_many( 'analogs' => 'autohome::Schema::Result::AnalogSensor', { 'foreign.controller_id' => 'self.id' } );
__PACKAGE__->has_many( 'digitals' => 'autohome::Schema::Result::DigitalSensor', { 'foreign.controller_id' => 'self.id' } );
# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
