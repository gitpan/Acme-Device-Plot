package Acme::Device::Plot;

use strict;

=head1 NAME

Acme::Device::Plot - Factory object for creating plot devices for TV & movies

=head1 SYNOPSIS

Writers the world over often get stuck wondering what sorts of interesting
things can happen to a story, and often come up empty.  Leave it to the
power of Perl to help automate this critical task.

    my $device = new Acme::Device::Plot;
    print $device->romantic();

This module is a work in progress, undoubtedly best served by input from
the masses.  The C<romantic()> method is the only one implemented right
now, but I welcome outside help.

=cut

=head1 VERSION

Version 0.01 

    $Header: /home/cvs/adp/Plot.pm,v 1.6 2003/01/05 03:50:11 andy Exp $

=cut

our $VERSION = '0.01';

=head1 METHODS

=head2 C<new()>

Create an Acme::Device::Plot object.

=cut

sub new {
    my $class = shift;
    my $self  = {};

    bless $self, $class;

    return $self;
}

=head2 romantic()

Returns a plot device for romances and romantic comedies.  For example:

    print $device->romantic();

might print "He accidentally finds her and her ex-boyfriend coming out
of a broom closet on Christmas Eve"

=cut

sub romantic {
    my $self = shift;

    my $set = 
	oneof( 
	    ["He", "her and her " . oneof( "ex-boyfriend", "boss" )], 
	    [oneof("She","Her best friend"), "him and " . oneof( "his ex-girlfriend", "a stripper", "a random sexy passerby" ) ],
	);
    my $how = oneof( 
	"stumbles upon", 
	"accidentally finds", 
	"overhears" 
    );
    my $where = oneof( 
	"in an elevator", 
	"coming out of a broom closet" 
    );
    my $when = oneof(
	"at the office",
	"at a party",
	"on Christmas Eve",
	"at the bookstore",
	"at a restaurant",
	"during a wedding",
	"at a hotel bar",
    );

    return join( " ", $set->[0], $how, $set->[1], $where, $when );
}

=head2 establishing()

Hero comes out of retirement

Hero quits in disgust

=head2 minor()

=head2 major()

=head2 deus_ex_machina()

=head2 oneof( @options )

=cut

sub oneof {
    return $_[rand @_];
}

=head1 SEE ALSO

There are a number of resources on the net that collect these.  May the power of Perl automate this fearsome collection!

=over 4

=item *

L<http://sff.net/paradise/plottricks.htm>

=item *

L<http://enphilistor.users4.50megs.com/cliche.htm>

=item *

http://amethyst-angel.com/cliche.html

=item *

=back

=head1 TODO

=head1 LICENSE

This code may be distributed under the same terms as Perl itself.

=head1 AUTHOR

Andy Lester, E<lt>andy@petdance.comE<gt>

=cut

