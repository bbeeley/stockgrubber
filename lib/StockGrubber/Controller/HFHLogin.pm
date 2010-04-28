package StockGrubber::Controller::HFHLogin;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

use HTML::FormHandler;

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    my $form;

    my $authenticate_sub = sub {
        return if $form->has_errors;
        $c->authenticate({
            username => $form->field('username')->value,
            password => $form->field('password')->value,
        });
    };

    $form = HTML::FormHandler->new(
        field_list => [
            username => { type => 'Text', size => 60, required => 1 },
            password => {
                type => 'Password',
                size => 60,
                required => 1,
                apply => [{
                    check => $authenticate_sub,
                    message => 'Invalid Username, or bad password.'
                }],
            },
            submit => { type => 'Submit', value => 'Submit' },
        ],
    );

    $form->field('password')->add_action({
        check => sub {
        },
        message => 'Invalid Username, or bad password.',
    });

    $form->process($c->req->params);
    if ($form->validated) {
        $c->res->redirect('/home');
        $c->detach;
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
