# $Id: Read.pm,v 1.2 2003/03/16 17:52:59 philip Exp $
# $Name:  $

package Disk::File::Read;
use strict;
use warnings FATAL => 'all';
use Carp;

require Exporter;
#use AutoLoader qw(AUTOLOAD);

our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw(

) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
  d_io_file_get
  d_io_file_array
);

our $VERSION = do { my @r = (q$Revision: 1.2 $ =~ /\d+/g); sprintf " %d." . "%02d" x $#r, @r };

sub d_io_file_get {

  my ($file) = @_;

  local *FILE;

  open(FILE, "$file") || confess("open failed for $file because $!");
  local $/ = undef;
  my $contents = <FILE>;
  close(FILE) || confess("close failed for $file because $!");

  return $contents;
}

sub d_io_file_array_get {

  my ($file) = @_;

  local *FILE;

  open(FILE, "$file") || confess("open failed for $file because $!");
  my @lines = <FILE>;
  close(FILE) || confess("close failed for $file because $!");

  return @lines;
}

1;
__END__
=head1 NAME

Disk::File::Read - Utility to read a directory into a list

=head1 SYNOPSIS

  use Disk::File::Read;
  
=head2 EXPORT
  d_io_file_get
  d_io_file_array_get

=head1 AUTHOR

Philip M. Gollucci, E<lt>philip@p6m7g8.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2003 by Philip M. Gollucci

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
 
=cut
  
# $Log: Read.pm,v $
# Revision 1.2  2003/03/16 17:52:59  philip
# s/<gt>/E<gt>/g;
# Bug in h2xs generation doc stub
#
# Revision 1.1  2003/03/16 06:18:11  philip
# Added File Reading functions
#

