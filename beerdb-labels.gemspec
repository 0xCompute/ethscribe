# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{beerdb-labels}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Gerald Bauer"]
  s.date = %q{2013-08-10}
  s.description = %q{beerdb-labels gem - beer labels (24x24, 32x32, 48x48, 64x64) bundled for reuse w/ asset pipeline}
  s.email = %q{beerdb@googlegroups.com}
  s.extra_rdoc_files = ["History.md", "Manifest.txt", "README.md"]
  s.files = ["History.md", "Manifest.txt", "README.md", "Rakefile", "lib/beerdb/labels.rb", "lib/beerdb/labels/engine.rb", "lib/beerdb/labels/version.rb", "vendor/assets/images/labels/24x24/fullers1845.png", "vendor/assets/images/labels/24x24/fullerschiswick.png", "vendor/assets/images/labels/24x24/fullersdiscovery.png", "vendor/assets/images/labels/24x24/fullersesb.png", "vendor/assets/images/labels/24x24/fullershoneydew.png", "vendor/assets/images/labels/24x24/fullerslondonporter.png", "vendor/assets/images/labels/24x24/fullerslondonpride.png", "vendor/assets/images/labels/24x24/murphysred.png", "vendor/assets/images/labels/32x32/fullers1845.png", "vendor/assets/images/labels/32x32/fullerschiswick.png", "vendor/assets/images/labels/32x32/fullersdiscovery.png", "vendor/assets/images/labels/32x32/fullersesb.png", "vendor/assets/images/labels/32x32/fullershoneydew.png", "vendor/assets/images/labels/32x32/fullerslondonporter.png", "vendor/assets/images/labels/32x32/fullerslondonpride.png", "vendor/assets/images/labels/32x32/murphysred.png", "vendor/assets/images/labels/48x48/fullers1845.png", "vendor/assets/images/labels/48x48/fullerschiswick.png", "vendor/assets/images/labels/48x48/fullersdiscovery.png", "vendor/assets/images/labels/48x48/fullersesb.png", "vendor/assets/images/labels/48x48/fullershoneydew.png", "vendor/assets/images/labels/48x48/fullerslondonporter.png", "vendor/assets/images/labels/48x48/fullerslondonpride.png", "vendor/assets/images/labels/48x48/murphysred.png", "vendor/assets/images/labels/64x64/fullers1845.png", "vendor/assets/images/labels/64x64/fullerschiswick.png", "vendor/assets/images/labels/64x64/fullersdiscovery.png", "vendor/assets/images/labels/64x64/fullersesb.png", "vendor/assets/images/labels/64x64/fullershoneydew.png", "vendor/assets/images/labels/64x64/fullerslondonporter.png", "vendor/assets/images/labels/64x64/fullerslondonpride.png", "vendor/assets/images/labels/64x64/murphysred.png"]
  s.homepage = %q{https://github.com/geraldb/beer.db.labels}
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{beerdb-labels}
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{beerdb-labels gem - beer labels (24x24, 32x32, 48x48, 64x64) bundled for reuse w/ asset pipeline}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<hoe>, ["~> 3.6"])
    else
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<hoe>, ["~> 3.6"])
    end
  else
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<hoe>, ["~> 3.6"])
  end
end
