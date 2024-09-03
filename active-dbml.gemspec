# frozen_string_literal: true

require_relative "lib/active/dbml/version"

Gem::Specification.new do |spec|
  spec.name = "active-dbml"
  spec.version = Active::DBML::VERSION

  # Author
  spec.authors     = ["ukmshi"]
  spec.email       = ["ukyo.mashiko@gmail.com"]

  # Summary
  spec.summary     = "Active::DBML: A Gem for Bridging Database Design and Development"
  spec.description = "Active::DBML is a new, useful Ruby gem designed to streamline database development."
  spec.homepage    = "https://github.com/ukmshi/ActiveDBML"
  spec.license     = "MIT"
  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"
  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Other
  # spec.files = Dir.chdir(__dir__) do
  #   `git ls-files -z`.split("\x0").reject do |f|
  #     (File.expand_path(f) == __FILE__) ||
  #       f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
  #   end
  # end
  # spec.bindir = "exe"
  # spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.files         = `git ls-files`.split($\)
  spec.executables   = spec.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extra_rdoc_files = ['README.md', 'CHANGELOG.md']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})

  # Dependence
  spec.required_ruby_version = ">= 2.6.0"
  spec.add_runtime_dependency "activerecord", ">= 4.2"
  spec.add_development_dependency "rake"
end
