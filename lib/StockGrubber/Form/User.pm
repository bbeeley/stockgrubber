package StockGrubber::Form::User;
use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Model::DBIC';
with 'HTML::FormHandler::Render::Simple';

use namespace::autoclean;

has '+item_class' => ( default => 'Users' );

has_field 'first_name' => ( type => 'Text', size => 60, required => 1, );
has_field 'last_name' => ( type => 'Text', size => 60, required => 1, );
has_field 'username' => ( type => 'Text', size => 60, required => 1, );
has_field 'password' => ( type => 'Password', size => 60, required => 1, );
has_field 'submit' => ( type => 'Submit' );

__PACKAGE__->meta->make_immutable;
