require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/hubruby'

Hoe.plugin :newgem
# Hoe.plugin :website
# Hoe.plugin :cucumberfeatures

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec 'hubruby' do
  self.developer 'Diógenes Falcão', 'diogenes {d-o-t} araujo {at} gmail.com'
  self.rubyforge_name = self.name
  self.extra_deps     = [['httparty','= 0.6.1']]
  self.version = '0.0.4'
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }

# remove_task :default
task :default => [:spec]
