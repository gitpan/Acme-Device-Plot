# $Id: Makefile.PL,v 1.2 2003/01/05 03:01:58 andy Exp $
use strict;
use ExtUtils::MakeMaker;
use File::Find;

find( \&filecheck, "." );

sub filecheck {
	unlink if /~$/;	# Remove any vi backup files
	die "Aborting: Swapfile $_ found" if /\.swp$/;
}

&WriteMakefile(
	NAME		=> 'Acme::Device::Plot',
	DISTNAME	=> 'Acme-Device-Plot',
	VERSION_FROM	=> 'Plot.pm',
	ABSTRACT_FROM	=> 'Plot.pm',
	AUTHOR		=> 'Andy Lester <andy@petdance.com>',
	PM		=> {'Plot.pm' => '$(INST_LIBDIR)/Plot.pm'},
	PREREQ_PM	=> {
		'Test::More'	=> 0,
		'Test::Builder' => 0,
		},
	dist => {
		COMPRESS => 'gzip -9f', 
		SUFFIX => 'gz',
		},
	);

