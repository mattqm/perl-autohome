use utf8;
package autohome::Schema::Result::ErrorDesc;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

autohome::Schema::Result::ErrorDesc

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<error_desc>

=cut

__PACKAGE__->table("error_desc");

=head1 ACCESSORS

=head2 code

  data_type: 'integer'
  is_nullable: 0

=head2 lang_id

  data_type: 'varchar'
  default_value: 'en_US'
  is_nullable: 0
  size: 5

=head2 desc

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "code",
  { data_type => "integer", is_nullable => 0 },
  "lang_id",
  {
    data_type => "varchar",
    default_value => "en_US",
    is_nullable => 0,
    size => 5,
  },
  "desc",
  { data_type => "varchar", is_nullable => 0, size => 255 },
);


# Created by DBIx::Class::Schema::Loader v0.07024 @ 2013-09-30 12:33:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kBXbDY0F4+3G8weJWK0TUw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
