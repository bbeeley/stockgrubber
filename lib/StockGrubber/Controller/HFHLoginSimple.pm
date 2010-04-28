package StockGrubber::Controller::HFHLoginSimple;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

StockGrubber::Controller::HFHLoginSimple - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

use HTML::FormHandler;

has form => (
    is => 'ro',
    default => sub {
        return HTML::FormHandler->new(
            field_list => [
                username => { type => 'Text', size => 60, required => 1 },
                password => { type => 'Password', size => 60, required => 1 },
                submit => { type => 'Submit', value => 'Submit' },
            ],
        );
    },
);

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    my $form = $self->form;

    $form->process($c->req->params);
    if ($form->validated) {
        my $user_info = $form->value;
        if ($c->authenticate($user_info)) {
            $c->res->redirect( '/home' );
            $c->detach;
        }
    }

    my $rendered_form = $form->render;
    $c->stash->{template} = \$rendered_form;
}


=head1 AUTHOR

Bryan James Beeley,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
