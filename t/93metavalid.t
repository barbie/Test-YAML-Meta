use Test::More;

eval "use Test::YAML::Valid";
if($@) {
    plan skip_all => "Test::YAML::Valid required for testing YAML";
} else {
    plan tests => 1;
    yaml_file_ok('META.yml');
}
