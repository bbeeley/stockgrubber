use strict;
use warnings;
use Test::More;

BEGIN { use_ok 'Catalyst::Test', 'StockGrubber' }
BEGIN { use_ok 'StockGrubber::Controller::HFHLogin' }

ok( request('/hfhlogin')->is_success, 'Request should succeed' );
done_testing();
