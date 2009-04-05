use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'			=> 'Test::YAML::Meta',
    'VERSION_FROM'	=> 'lib/Test/YAML/Meta.pm',
    'PREREQ_PM'		=> {
		Test::Builder       => 0,
		Test::YAML::Valid	=> 0.03,
		Test::More	        => 0.70,	# for testing
	},
	NO_META			=> 1,

    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT	=> 'META.yml testing module',
       AUTHOR	=> 'Barbie <barbie@cpan.org>') : ()),
);
