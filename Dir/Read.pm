# $Id: Read.pm,v 1.3 2003/03/16 17:52:57 philip Exp $
# $Name:  $

package Disk::Dir::Read;
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
  d_io_dir_get
);

our $VERSION = do { my @r = (q$Revision: 1.3 $ =~ /\d+/g); sprintf " %d." . "%02d" x $#r, @r };

sub d_io_dir_get {

  my ($dir) = @_;

  local *DIR;

  opendir(DIR, "$dir") || confess ("opendir failed for $dir because $!");
  my @files = readdir DIR;
  closedir(DIR) || confess ("closedir failed for $dir because $!");

  @files = grep  /^[A-Za-z0-9].*?\.\w+$/, @files;

  return @files;
}

1;
__END__
=head1 NAME
  
Disk::Dir::Read - Utility to read a directory into a list

=head1 SYNOPSIS
  
  use Disk::Dir::Read;
  my @contents = &d_io_dir_get("/path/to/dir");

  Note: We only return entries matching /^[A-Za-z0-9].*?\.\w+$/

=head2 EXPORT
  d_io_dir_get()
  
=head1 AUTHOR

Philip M. Gollucci, E<lt>philip@p6m7g8.comE<gt>
  
=head1 COPYRIGHT AND LICENSE
  
Copyright 2003 by Philip M. Gollucci
  
This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

# $Log: Read.pm,v $
# Revision 1.3  2003/03/16 17:52:57  philip
# s/<gt>/E<gt>/g;
# Bug in h2xs generation doc stub
#
# Revision 1.2  2003/03/16 06:03:14  philip
# Condensed regex,
# Added note about what entries are returned
#
# Revision 1.1.1.1  2003/03/16 05:55:36  philip
# Imported Sources
#

