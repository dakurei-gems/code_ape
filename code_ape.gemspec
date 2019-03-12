lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'code_ape/version'

Gem::Specification.new do |spec|
  spec.name          = 'code_ape'
  spec.version       = CodeApe::VERSION
  spec.authors       = ['Maxime Palanchini']
  spec.email         = ['maxime.palanchini@gmail.com']

  spec.summary       = 'Ruby gem to obtain the labels of the APE code'
  spec.homepage      = 'https://github.com/Dakurei/code_ape'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest'
end
