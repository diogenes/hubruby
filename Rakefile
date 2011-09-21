require 'rake/rdoctask'
require 'rspec/core/rake_task'
require 'bundler'
Bundler::GemHelper.install_tasks

desc 'Run all RSpec tests'
RSpec::Core::RakeTask.new(:spec)

task :default => :spec
task :build => :spec

Rake::RDocTask.new do |rd|
  rd.main = "README.rdoc"
  rd.rdoc_files.include("README.rdoc", "lib/**/*.rb")
  rd.rdoc_dir = 'doc'
end
