package SGDB::Result::Sessions;

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->table('sessions');

__PACKAGE__->add_columns(
  id => { is_nullable => 0, data_type => 'varchar', size => 72 },
  session_data => { data_type => 'text', is_nullable => 1 },
  expires => { data_type => 'integer', is_nullable => 1, size => 16 },
);

__PACKAGE__->set_primary_key('id');

1;
