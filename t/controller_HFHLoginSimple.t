use strict;
use warnings;
use Test::More;

BEGIN { use_ok 'Catalyst::Test', 'StockGrubber' }
BEGIN { use_ok 'StockGrubber::Controller::HFHLoginSimple' }

ok( request('/hfhloginsimple')->is_success, 'Request should succeed' );
done_testing();
