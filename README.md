[![Gem](https://img.shields.io/gem/v/code_ape.svg)](https://rubygems.org/gems/code_ape)
[![Gem](https://img.shields.io/gem/dt/code_ape.svg)](https://rubygems.org/gems/code_ape)
[![Gem](https://img.shields.io/badge/docs-v3.0.0-979797.svg)](https://dakurei-gems.github.io/code_ape/v3.0.0/)
[![Github Actions Rspec](https://github.com/dakurei-gems/code_ape/actions/workflows/rspec.yml/badge.svg?branch=master&event=push)](https://github.com/dakurei-gems/code_ape/actions/workflows/rspec.yml)
[![Github Actions Standard](https://github.com/dakurei-gems/code_ape/actions/workflows/standard.yml/badge.svg?branch=master&event=push)](https://github.com/dakurei-gems/code_ape/actions/workflows/standard.yml)
[![Inline docs](https://img.shields.io/badge/docs-master-979797.svg)](https://dakurei-gems.github.io/code_ape/master/)

# code_ape

Gem for obtaining the wording of a specific 'ape code'

## Installation

Add this line to your application's Gemfile:

```ruby
gem "code_ape"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install code_ape

## Usage

```ruby
require "code_ape"

CodeApe.ape("58")
=> #<CodeApe::Subsection @key="58", @label="Édition">

CodeApe.ape("58")&.label
=> "Édition"

CodeApe.ape("58")&.divisions
=>
[#<CodeApe::Division @key="58.1", @label="Édition de livres et périodiques et autres activités d'édition">,
 #<CodeApe::Division @key="58.2", @label="Édition de logiciels">]

CodeApe.ape("5829")&.classes
=>
[#<CodeApe::Class
  @division_key="58.2",
  @group_key="58.29",
  @key="58.29A",
  @label="Édition de logiciels système et de réseau",
  @section_key="J",
  @subsection_key="58">,
 #<CodeApe::Class
  @division_key="58.2",
  @group_key="58.29",
  @key="58.29B",
  @label="Édition de logiciels outils de développement et de langages",
  @section_key="J",
  @subsection_key="58">,
 #<CodeApe::Class
  @division_key="58.2",
  @group_key="58.29",
  @key="58.29C",
  @label="Édition de logiciels applicatifs",
  @section_key="J",
  @subsection_key="58">]

CodeApe.ape("5829C")
=> #<CodeApe::Class
 @division_key="58.2",
 @group_key="58.29",
 @key="58.29C",
 @label="Édition de logiciels applicatifs",
 @section_key="J",
 @subsection_key="58">

CodeApe.ape("5829C")&.label
=> "Édition de logiciels applicatifs"

CodeApe.ape("5830A")
=> nil

CodeApe.section("A")
=> #<CodeApe::Section @key="A", @label="Agriculture, sylviculture et pêche">
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Dakurei/code_ape. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CodeApe project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Dakurei/code_ape/blob/master/CODE_OF_CONDUCT.md).
