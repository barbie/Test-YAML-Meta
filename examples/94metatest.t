#!/usr/bin/perl -w
use strict;

use Test::More;

# Skip if doing a regular install
plan skip_all => "Author tests not required for installation"
    unless ( $ENV{AUTOMATED_TESTING} );

eval "use Test::YAML::Meta";
plan skip_all => "Test::YAML::Meta required for testing META.yml" if $@;

plan 'no_plan';

my $meta = meta_spec_ok(undef,undef,@_);

use Test::YAML::Meta;                           # enter your module name here
my $version = $Test::YAML::Meta::VERSION;       # enter your module name here

is($meta->{version},$version,
    'META.yml distribution version matches');

if($meta->{provides}) {
    for my $mod (keys %{$meta->{provides}}) {
        is($meta->{provides}{$mod}{version},$version,
            "META.yml entry [$mod] version matches");
    }
}
