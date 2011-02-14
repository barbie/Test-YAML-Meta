package Test::YAML::Meta;

use warnings;
use strict;

use vars qw($VERSION);
$VERSION = '0.18';

#############################################################################
#Library Modules															#
#############################################################################

use base 'Test::CPAN::Meta::YAML';

q( Currently Listening To: Paul Menel - "The Nurse" from 'Three Sides To Every Story');

__END__

#----------------------------------------------------------------------------

=head1 NAME

Test::YAML::Meta - Validation of the META.yml file in a distribution.

=head1 DESCRIPTION

This module has now been replaced by L<Test::CPAN::Meta::YAML>. Please see
that distribution for further details.

=head1 ABSTRACT

A test module to validate a META.yml file.

=head1 BUGS, PATCHES & FIXES

There are no known bugs at the time of this release. However, if you spot a
bug or are experiencing difficulties that are not explained within the POD
documentation, please send an email to barbie@cpan.org or submit a bug to the
RT system (http://rt.cpan.org/Public/Dist/Display.html?Name=Test-YAML-Meta).
However, it would help greatly if you are able to pinpoint problems or even
supply a patch.

Fixes are dependant upon their severity and my availablity. Should a fix not
be forthcoming, please feel free to (politely) remind me.

=head1 SEE ALSO

L<Test::CPAN::Meta::YAML>.

=head1 DSLIP

  b - Beta testing
  d - Developer
  p - Perl-only
  O - Object oriented
  p - Standard-Perl: user may choose between GPL and Artistic

=head1 AUTHOR

Barbie, <barbie@cpan.org>
for Miss Barbell Productions, L<http://www.missbarbell.co.uk>

=head1 COPYRIGHT AND LICENSE

  Copyright (C) 2009-2011 Barbie for Miss Barbell Productions

  This module is free software; you can redistribute it and/or
  modify it under the Artistic Licence v2.

=cut
