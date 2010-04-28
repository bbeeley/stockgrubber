use strict;
use warnings;
use Test::More;

BEGIN { use_ok 'Catalyst::Test', 'StockGrubber' }
BEGIN { use_ok 'StockGrubber::Controller::AddUser' }

ok( request('/adduser')->is_success, 'Request should succeed' );
done_testing();
