use utf8;
package autohome::Schema::Result::Setting;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

autohome::Schema::Result::Setting

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<settings>

=cut

__PACKAGE__->table("settings");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 attribute

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 hostname

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 value

  data_type: 'varchar'
  is_nullable: 0
  size: 256

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "attribute",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "hostname",
  { data_type => "varchar", is_nullable => 1, size => 32 },
  "value",
  { data_type => "varchar", is_nullable => 0, size => 256 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<unique_attr>

=over 4

=item * L</attribute>

=item * L</hostname>

=back

=cut

__PACKAGE__->add_unique_constraint("unique_attr", ["attribute", "hostname"]);


# Created by DBIx::Class::Schema::Loader v0.07024 @ 2013-09-26 16:55:03
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ytuARvbuErhzZ7hsFB0pKQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
