# <img src="../Pics/lexx_headshot_clear.png" width="100px"/> Lexxeous's Gem Management: <img src="../Pics/RoR/gem_logo.jpeg" width="100px"/>
### Basics for Ruby Gem Building and Usage.

##### Building a Ruby Gem.
```sh
# Create directory and files for "gem_name".
$ bundle gem <gem_name>
```

##### Define Gem Specifications:
```ruby
# Gem specifications passed as a block.
Gem::Specification.new do |spec|
	spec. #spec block code goes here...
end
```

##### Using Gem Versions (In Gemfile).
```ruby
gem "<gem_name>" # for latest gem version
gem "<gem_name>" ">= <version_number>" # greater than or equal to "version_number"
gem "<gem_name>" "< <version_number>" # less than "version_number"
gem "<gem_name>" "~> <version_number>" # greater than or equal to "version_number" AND less than next root version release
gem "<gem_name>" "~> 2.1.4" # greater than or equal to 2.1.4 AND less than 3.0.0
gem "<gem_name>", :require/:path/:group/(:engine, :engine_version)/(:git, :tag/:branch/:ref) # extra parameters for advanced gem settings
```

##### Adding Gem Dependencies (In Gemspec).
```ruby
# Add a dependency for development only.
spec.add_development_dependency

# Add a dependency for all environments.
spec.add_dependency
```

##### Using TDD (Test Driven Development).
```sh
# Run tests using Rspec
rake spec
rspec spec
rspec # shorthand command

# Run tests using Minitest
rails test
```

##### Gem Naming Conventions.
> Use dashes `-` for paths. Use underscores `_` for multi-word names.

| Gem Name             | Require Statement              | Main Class or Module  |
|----------------------|--------------------------------|-----------------------|
| ruby_parser          | require "ruby_parser"          | RubyParser            |
| rdoc-data            | require "rdoc/data"            | RDoc::Data            |
| net-http-persistent  | require "net/http/persistent"  | Net::HTTP::Persistent |
| net-http-digest_auth | require "net/http/digest_auth" | Net::HTTP::DigestAuth |


##### List of Useful Gems.
```sh
# gem install
 $ better_errors # provides better development errors for your localhost
 $ cancancan
 $ devise
 $ faker # provides randomized functionality ; good for seeding
 $ letter_opener # preview "sent" email via a web browser
 $ pry       # 
 $ pry-rails # the popular ruby on rails debugger(s) we all know and love
```