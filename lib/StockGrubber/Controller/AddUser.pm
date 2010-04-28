package StockGrubber::Controller::AddUser;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

StockGrubber::Controller::AddUser - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

use StockGrubber::Form::User;

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    my $form = StockGrubber::Form::User->new(
        schema => $c->model('SGDB')->schema,
    );

    $form->process($c->req->params);
    if ($form->validated) {
        $c->res->redirect('/login');
        $c->detach;
    }

    $c->stash->{form} = $form;
}


=head1 AUTHOR

Bryan James Beeley,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
