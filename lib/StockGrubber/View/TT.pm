package StockGrubber::View::TT;

use strict;
use base 'Catalyst::View::TT';

__PACKAGE__->config(
#    DEBUG => DEBUG_ALL,
    # Change default TT extension
    TEMPLATE_EXTENSION => '.tt2',
    # Set the location for TT files
    INCLUDE_PATH => [
        StockGrubber->path_to( 'root', 'src' ),
    ],
    # Set to 1 for detailed timer stats in your HTML as comments
    TIMER              => 0,
    # Optimization for how long to wait between checks for template changes
#    STAT_TTL => 600,
#    COMPILE_DIR => '/tmp/template_cache',
    # This is your wrapper template located in the 'root/src'
#    WRAPPER => 'wrapper/full_page.tt2',
#    PRE_PROCESS => 'include/default',
);

=head1 NAME

StockGrubber::View::TT - TT View for StockGrubber

=head1 DESCRIPTION

TT View for StockGrubber. 

=head1 SEE ALSO

L<StockGrubber>

=head1 AUTHOR

Bryan James Beeley,,,

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
