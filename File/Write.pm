# $Id: Write.pm,v 1.1 2003/03/16 06:44:53 philip Exp $
# $Name:  $

package Disk::File::Write;
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
  d_io_file_write
  d_io_file_append
);

our $VERSION = do { my @r = (q$Revision: 1.1 $ =~ /\d+/g); sprintf " %d." . "%02d" x $#r, @r };

sub d_io_file_output ($$$) {
  
  my ($file, $contents, $flag) = @_;

  local *FILE;

  open(FILE, "$flag$file") || confess("open failed for $file because $!");
  binmode FILE;
  print FILE $contents;
  close(FILE) || confess("close failed for $file because $!");

  return;
}

sub d_io_file_write ($$) {

  my ($file, $contents) = @_;

  &d_io_file_output($file, $contents, '>');

  return;
}

sub d_io_file_append ($$) {

  my ($file, $contents) = @_;

  &d_io_file_output($file, $contents, '>>');

  return;
}

1;
__END__
=head1 NAME

Disk::File::Write - Utility to write

=head1 SYNOPSIS

  use Disk::File::Write

=head2 EXPORT
  d_io_file_write
  d_io_file_append

=head1 AUTHOR

Philip M. Gollucci, E<lt>philip@p6m7g8.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2003 by Philip M. Gollucci

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

# $Log: Write.pm,v $
# Revision 1.1  2003/03/16 06:44:53  philip
# Added uility to Write Files.
#

