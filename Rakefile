require 'rake/rdoctask'
require 'rspec/core/rake_task'
require 'bundler'
Bundler::GemHelper.install_tasks

desc 'Run all RSpec tests'
RSpec::Core::RakeTask.new(:spec)

task :default => :spec
task :build => :spec
