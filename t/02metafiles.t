#!/usr/bin/perl -w
use strict;

use Test::More  tests => 68;
use Test::YAML::Meta::Version;

    my $syck_loaded = 0;
	eval {
	    require YAML::Syck;
	    eval "use YAML::Syck qw(LoadFile)";
	    $syck_loaded = 1;
    };
    if(!$syck_loaded){
        require YAML;
        eval "use YAML qw(LoadFile)";
    }

my $vers = '1.3';
my @tests = (
    { file => 't/samples/00-META.yml', fail => 0, errors => 0, bad => 0, faults => 0 },
    { file => 't/samples/01-META.yml', fail => 0, errors => 0, bad => 0, faults => 0 },
    { file => 't/samples/02-META.yml', fail => 1, errors => 2, bad => 1, faults => 1 },
    { file => 't/samples/03-META.yml', fail => 0, errors => 0, bad => 0, faults => 0 },
    { file => 't/samples/04-META.yml', fail => 1, errors => 1, bad => 1, faults => 1 },
    { file => 't/samples/05-META.yml', fail => 0, errors => 0, bad => 0, faults => 0 },
    { file => 't/samples/06-META.yml', fail => 1, errors => 3, bad => 1, faults => 3 },
    { file => 't/samples/07-META.yml', fail => 0, errors => 0, bad => 0, faults => 0 },
    { file => 't/samples/08-META.yml', fail => 0, errors => 0, bad => 0, faults => 0 },
    { file => 't/samples/09-META.yml', fail => 1, errors => 1, bad => 1, faults => 1 },
    { file => 't/samples/10-META.yml', fail => 1, errors => 1, bad => 1, faults => 1 },
    { file => 't/samples/11-META.yml', fail => 1, errors => 2, bad => 1, faults => 1 },
    { file => 't/samples/12-META.yml', fail => 1, errors => 1, bad => 0, faults => 0 },
    { file => 't/samples/13-META.yml', fail => 1, errors => 1, bad => 0, faults => 0 },
    { file => 't/samples/14-META.yml', fail => 1, errors => 1, bad => 0, faults => 0 },
    { file => 't/samples/15-META.yml', fail => 1, errors => 1, bad => 0, faults => 0 },
    { file => 't/samples/16-META.yml', fail => 0, errors => 0, bad => 0, faults => 0 },
);

for my $test (@tests) {
    my $yaml = LoadFile($test->{file});

    my $spec = Test::YAML::Meta::Version->new(spec => $vers, yaml => $yaml);

    my $result = $spec->parse();
    my @errors = $spec->errors();

    is($result,         $test->{fail},   "check result for $test->{file}");
    is(scalar(@errors), $test->{errors}, "check errors for $test->{file}");

    if(scalar(@errors) != $test->{errors}) {
        print STDERR "# failed: $test->{file}\n";
        print STDERR "# errors: $_\n"  for(@errors);
    }
}

for my $test (@tests) {
    my $yaml = LoadFile($test->{file});

    my $spec = Test::YAML::Meta::Version->new(yaml => $yaml);

    my $result = $spec->parse();
    my @errors = $spec->errors();

    is($result,         $test->{bad},    "check result for $test->{file}");
    is(scalar(@errors), $test->{faults}, "check errors for $test->{file}");

    if(scalar(@errors) != $test->{faults}) {
        print STDERR "# failed: $test->{file}\n";
        print STDERR "# errors: $_\n"  for(@errors);
    }
}
