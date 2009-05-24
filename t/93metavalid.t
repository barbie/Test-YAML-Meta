use Test::More;

# Skip if doing a regular install
plan skip_all => "Author tests not required for installation"
    unless ( $ENV{AUTOMATED_TESTING} );

eval "use Test::YAML::Valid";
if($@) {
    plan skip_all => "Test::YAML::Valid required for testing YAML";
} else {
    plan tests => 1;
    yaml_file_ok('META.yml');
}
