load "lib/code_ape/version.rb"

Gem::Specification.new do |spec|
  spec.name = "code_ape"
  spec.version = CodeApe::VERSION
  spec.authors = ["Maxime Palanchini"]
  spec.email = ["maxime.palanchini@gmail.com"]

  spec.summary = "Ruby gem to obtain the labels of the APE code"
  spec.description = "Ruby gem to obtain the labels of the APE code"
  spec.homepage = "https://github.com/dakurei-gems/code_ape"
  spec.license = "MIT"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/dakurei-gems/code_ape"
  spec.metadata["changelog_uri"] = "https://github.com/dakurei-gems/code_ape/main/README.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ resources/ .git .github appveyor Gemfile CODE_OF_CONDUCT.md lefthook.yml Rakefile README.md .markdownlint.json .rspec .standard.yml .yardopts])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 3.2.0"

  spec.add_dependency "json"
end
