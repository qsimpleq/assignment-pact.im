# README

## Steps

```shell
rails new . --skip-test --skip-system-test
bundle add rspec-rails
bundle add rubocop-rspec
bundle add rubocop-rspec_rails
bin/rails generate rspec:install

cat <<EOF >> .rubocop.yml
require:
  - rubocop-rspec
  - rubocop-rspec_rails
EOF

bundle exec rubocop -a
```
