use utf8;
package autohome::Schema::Result::ErrorLog;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

autohome::Schema::Result::ErrorLog

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<error_log>

=cut

__PACKAGE__->table("error_log");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 code

  data_type: 'integer'
  is_nullable: 0

=head2 dt

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "code",
  { data_type => "integer", is_nullable => 0 },
  "dt",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07024 @ 2013-09-30 12:33:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zLYDIdT/RAmuIFMfuShZ2Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
