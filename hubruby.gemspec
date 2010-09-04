# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{hubruby}
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Di\303\263genes Falc\303\243o"]
  s.date = %q{2010-09-03}
  s.description = %q{A simple Ruby library for accessing the current GitHub API (v2).}
  s.email = ["diogenes {d-o-t} araujo {at} gmail.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.rdoc", "Rakefile", "TODO", "hubruby.gemspec", "lib/github/base.rb", "lib/github/finders.rb", "lib/github/models/repository.rb", "lib/github/models/user.rb", "lib/hubruby.rb", "script/console", "script/destroy", "script/generate", "spec/github/github_spec.rb", "spec/github/models/repository_spec.rb", "spec/github/models/user_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "tasks/rspec.rake"]
  s.homepage = %q{http://github.com/diogenes/hubruby}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{hubruby}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{A simple Ruby library for accessing the current GitHub API (v2).}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, ["= 0.6.1"])
      s.add_development_dependency(%q<rubyforge>, [">= 2.0.4"])
      s.add_development_dependency(%q<hoe>, [">= 2.6.1"])
    else
      s.add_dependency(%q<httparty>, ["= 0.6.1"])
      s.add_dependency(%q<rubyforge>, [">= 2.0.4"])
      s.add_dependency(%q<hoe>, [">= 2.6.1"])
    end
  else
    s.add_dependency(%q<httparty>, ["= 0.6.1"])
    s.add_dependency(%q<rubyforge>, [">= 2.0.4"])
    s.add_dependency(%q<hoe>, [">= 2.6.1"])
  end
end
