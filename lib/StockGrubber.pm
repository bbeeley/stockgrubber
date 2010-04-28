package StockGrubber;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

# Set flags and add plugins for the application
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root
#                 directory

use Catalyst qw/
    -Debug
    ConfigLoader
    Static::Simple
    Authentication
    Session
    Session::Store::DBIC
    Session::State::Cookie
/;

extends 'Catalyst';

our $VERSION = '0.02';
$VERSION = eval $VERSION;

# Configure the application.
#
# Note that settings in stockgrubber.conf (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with an external configuration file acting as an override for
# local deployment.

__PACKAGE__->config(
    name => 'StockGrubber',
    # Disable deprecated behavior needed by old applications
    disable_component_resolution_regex_fallback => 1,
    default_view => 'TTSite',
    session => {
        dbic_class => 'SGDB::Sessions',
        expires    => 3600,
        flash_to_stash => 1,
    },
    'Plugin::Authentication' => {
        default_realm => 'default',
        realms => {
            default => {
                credential => {
                    class => 'Password',
                    password_field => 'password',
                    password_type => 'self_check'
                },
                store => {
                    class => 'DBIx::Class',
                    user_class => 'SGDB::Users',
                    use_userdata_from_session => 1,
                },
            },
        },
    },
);

# Start the application
__PACKAGE__->setup();


=head1 NAME

StockGrubber - Catalyst based application

=head1 SYNOPSIS

    script/stockgrubber_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<StockGrubber::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Bryan James Beeley,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
