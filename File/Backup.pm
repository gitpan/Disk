# $Id: Backup.pm,v 1.1 2003/03/16 07:44:13 philip Exp $
# $Name:  $

package Disk::File::Backup;
use strict;
use warnings FATAL => 'all';
use Carp;

use Disk::File::Read;
use Disk::File::Write;
use DateTime::Current;
use DateTime::Format;

require Exporter;
#use AutoLoader qw(AUTOLOAD);

our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw(

) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
  d_io_file_backup
);

our $VERSION = do { my @r = (q$Revision: 1.1 $ =~ /\d+/g); sprintf " %d." . "%02d" x $#r, @r };

sub d_io_file_backup ($) {

  my ($file) = @_;

  my $now_string = &dt_get();
  my $ts = &dt_format($now_string, "yyyymm_2dd_2-hh24_2mi_2ss_2");
  my $backup = "$file.$ts";
 
  &d_io_file_write($backup, &d_io_file_get($file));

  return;
}

__END__
=head1 NAME

Disk::File::Backup - Utility to backup/timestamp a file

=head1 SYNOPSIS

  use Disk::File::Backup

=head2 EXPORT
  d_io_file_backup

=head1 AUTHOR

Philip M. Gollucci, E<lt>philip@p6m7g8.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2003 by Philip M. Gollucci

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

# $Log: Backup.pm,v $
# Revision 1.1  2003/03/16 07:44:13  philip
# Added backup file utilities
#

1;

