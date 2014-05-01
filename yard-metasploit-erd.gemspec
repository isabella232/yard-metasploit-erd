# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yard/metasploit/erd/version'

Gem::Specification.new do |spec|
  spec.name          = 'yard-metasploit-erd'
  spec.version       = YARD::Metasploit::ERD::VERSION
  spec.authors       = ['Luke Imhoff']
  spec.email         = ['luke_imhoff@rapid7.com']
  spec.summary       = 'YARD plugin that add Metasploit::ERDs to namespaces and classes'
  spec.description   = "YARD plugin that uses metasploit-erd to add Entity-Relationship Diagrams to each namespace " \
                       "Module and ActiveRecord::Base subclass's documentation."
  spec.homepage      = 'https://github.com/rapid7/yard-metasploit-erd'
  spec.license       = 'BSD-3-clause'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake', '~> 10.3'
  spec.add_development_dependency 'rspec', '~> 2.14'

  # Generates namespace Module and Class<ActiveRecord::Base> specific ERDs for use in templates
  spec.add_runtime_dependency 'metasploit-erd', '0.0.1'
  # RailsERD::Domain is used directly to generate the _index.html ERD.
  spec.add_runtime_dependency 'rails-erd'
  # documentation
  # 0.8.7.4 has a bug where setters are not documented when @!attribute is used
  spec.add_runtime_dependency 'yard', '<= 0.8.7.4'
end