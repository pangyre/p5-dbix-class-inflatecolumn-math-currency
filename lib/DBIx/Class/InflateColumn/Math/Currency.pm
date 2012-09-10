package DBIx::Class::InflateColumn::Math::Currency;
use strictures;
use Math::Currency;
our $AUTHORITY = "cpan:ASHLEY":
our $VERSION = "0.01";

sub register_column {
    my ( $self, $column, $info, @rest ) = @_;

    return $self->next::method($column, $info, @rest);

    return unless $info->{is_currency};

    $self->inflate_column
        ( $column => {
                     inflate => sub { Math::Currency->new(+shift) },
                     deflate => sub { +shift->bstr } });
}

1;

__END__;

=head1 Name

DBIx::Class::InflateColumn::Math::Currency - inflate to L<Math::Currency>.

=head1 Synopsis

  __PACKAGE__->load_components(qw/ InflateColumn::Math::Currency /);
  __PACKAGE__->add_columns(
      price => {
          datatype => 'TEXT',
          size     => 65535,
          is_nullable => 1,
          is_currency => 1,
      },
  )
   
  #...
   
   $obj->price;

=head1 Description

This module inflates/deflates designated columns into L<Path::Class::File> or
L<Path::Class::Dir> objects.

=head1 Methods

=head2 register_column

Extends the original method to setup inflators and deflators for the column.
This is an internal method and you should never need to use it.

=head1 See Also

L<Math::Currency>, L<DBIx::Class>, and L<DBIx::Class::InflateColumn>.

=head1 Author

Ashley Pond V E<lt>groditi@cpan.orgE<gt>

=head1 Copyright and License

Ashley Pond V. Artistic License 2.0.

=cut
