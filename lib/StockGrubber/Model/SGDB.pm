package StockGrubber::Model::SGDB;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'SGDB',
    connect_info => [
        'dbi:SQLite:sg.db',
        
    ],
);

=head1 NAME

StockGrubber::Model::SGDB - Catalyst DBIC Schema Model
=head1 SYNOPSIS

See L<StockGrubber>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<SGDB>

=head1 AUTHOR

Bryan James Beeley,,,

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
