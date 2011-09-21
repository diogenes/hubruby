# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'hubruby'

Gem::Specification.new do |s|
  s.name = 'hubruby'
  s.version = Hubruby::VERSION.dup
  s.summary = 'A simple Ruby library for accessing the current GitHub API (v3)'
  s.author = 'Diógenes Falcão'
  s.email = 'diogenes.araujo@gmail.com'
  s.extra_rdoc_files = ['README.rdoc']
  s.has_rdoc = true

  s.files = Dir['lib/**/*.rb'] + Dir['spec/**/*.*']

  s.add_dependency('httparty', '>= 0.6.1')
end
