<!-- Gem Management -->

# <img src="../.pics/Lexxeous/lexx_headshot_clear.png" width="100px"/> Lexxeous's Gem Management: <img src="../.pics/RoR/gem_logo.jpeg" width="100px"/>
### Basics for Ruby Gem Building and Usage.

##### Building a Ruby Gem.
```sh
# Create directory and files for <gem_name>.
$ bundle gem <gem_name>
```

> Code for your package is placed within the lib directory. The convention is to have one Ruby file with the same name as your gem, since that gets loaded when `require 
<gem_name>` is run. That one file is in charge of setting up your gem’s code and API.

It's also best practice that a file name dictate the module/class name under the root namespace. Here are couple examples:<br>
`lib/<gem_name>/file_two.rb => GemName::FileOne`<br>
`lib/<gem_name>/file_one.rb => GemName::FileTwo`<br>

```sh
# Deploy your Ruby gem.
$ rake -T
rake build # build <gem_name>.<version_num>.gem into the pkg directory
rake install # build and install <gem_name>.<version_num>.gem into system gems
rake release # create tag v.<version_num> and build and push <gem_name>.<version_num>.gem to Rubygems
# OR
gem push path/to/<gem_name>-<version_num>.gem # manually push to https://rubygems.org
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
# Run tests using Rspec.
rake spec
rspec spec
rspec # shorthand command

# Run tests using Minitest.
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
> Use `gem list` to show all the gems currently installed on your system.
```sh
 $ better_errors # provides better development errors for your localhost
 $ devise # login management
 $ faker # provides randomized functionality ; good for seeding
 $ letter_opener # preview "sent" email via a web browser
 $ pry       # 
 $ pry-rails # the popular ruby on rails debugger(s) we all know and love
 $ simplecov
```