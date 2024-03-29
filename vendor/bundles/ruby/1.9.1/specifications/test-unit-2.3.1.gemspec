# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "test-unit"
  s.version = "2.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kouhei Sutou", "Haruka Yoshihara"]
  s.date = "2011-08-06"
  s.description = "Ruby 1.9.x bundles minitest not Test::Unit. Test::Unit\nbundled in Ruby 1.8.x had not been improved but unbundled\nTest::Unit (test-unit 2) will be improved actively.\n"
  s.email = ["kou@cozmixng.org", "yoshihara@clear-code.com"]
  s.executables = ["testrb"]
  s.extra_rdoc_files = ["README.textile", "TODO"]
  s.files = ["bin/testrb", "README.textile", "TODO"]
  s.homepage = "http://test-unit.rubyforge.org/"
  s.licenses = ["Ruby's and PSFL (lib/test/unit/diff.rb)"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "test-unit"
  s.rubygems_version = "1.8.24"
  s.summary = "test-unit 2 - Improved version of Test::Unit bundled in Ruby 1.8.x."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
