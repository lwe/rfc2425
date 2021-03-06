# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rfc2425}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lukas Westermann"]
  s.date = %q{2009-11-04}
  s.email = %q{lukas.westermann@gmail.com}
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    ".gitignore",
     "LICENCE",
     "README.md",
     "Rakefile",
     "VERSION.yml",
     "lib/rfc2425.rb",
     "lib/rfc2425/core_ext.rb",
     "lib/rfc2425/directory.rb",
     "lib/rfc2425/directory_information.rb",
     "lib/rfc2425/property.rb",
     "lib/rfc2425/utils.rb",
     "rails/init.rb",
     "test/test_helper.rb",
     "test/unit/builder_test.rb",
     "test/unit/core_ext_test.rb",
     "test/unit/lowlevel_api_test.rb",
     "test/unit/utils_test.rb"
  ]
  s.homepage = %q{http://github.com/lwe/rfc2425}
  s.licenses = ["LICENSE"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A pure Ruby Directory Information (RFC2425) implementation.}
  s.test_files = [
    "test/test_helper.rb",
     "test/unit/builder_test.rb",
     "test/unit/core_ext_test.rb",
     "test/unit/lowlevel_api_test.rb",
     "test/unit/utils_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_development_dependency(%q<rr>, [">= 0"])
      s.add_development_dependency(%q<activesupport>, [">= 2.3.0"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_dependency(%q<rr>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 2.3.0"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    s.add_dependency(%q<rr>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 2.3.0"])
  end
end

