package SGDB::Result::Users;

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components('EncodedColumn');

__PACKAGE__->table('users');

__PACKAGE__->add_columns(
  id => {
    is_nullable => 0,
    data_type => 'integer',
    size => 16,
    is_auto_increment => 1,
  },
  username => { data_type => 'varchar', is_nullable => 0, size => 60 },
  password => {
    data_type => 'varchar',
    is_nullable => 0,
    size => 60,
    encode_column => 1,
    encode_class => 'Digest',
    encode_args => { algorithm => 'MD5', format => 'base64' },
    encode_check_method => 'check_password',
  },
  first_name => { data_type => 'varchar', is_nullable => 0, size => 60 },
  last_name => { data_type => 'varchar', is_nullable => 0, size => 60 },
);

__PACKAGE__->set_primary_key('id');

__PACKAGE__->add_unique_constraint("unique_user_login", ["username"]);

1;
