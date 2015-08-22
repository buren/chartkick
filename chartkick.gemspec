# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "chartkick/version"

Gem::Specification.new do |spec|
  spec.name          = "chartkick"
  spec.version       = Chartkick::VERSION
  spec.authors       = ["Andrew Kane"]
  spec.email         = ["acekane1@gmail.com"]
  spec.description   = "Create beautiful Javascript charts with one line of Ruby"
  spec.summary       = "Create beautiful Javascript charts with one line of Ruby"
  spec.homepage      = "http://chartkick.com"
  spec.license       = "MIT"

  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)

  # get an array of submodule dirs by executing 'pwd' inside each submodule
  gem_dir = File.expand_path(File.dirname(__FILE__)) + "/"
  `git submodule --quiet foreach pwd`.split($\).each do |submodule_path|
    Dir.chdir(submodule_path) do
      submodule_relative_path = submodule_path.sub gem_dir, ""
      spec.files << "#{submodule_relative_path}/chartkick.js"
    end
  end

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
