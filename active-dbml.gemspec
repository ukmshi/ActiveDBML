require_relative "lib/active/dbml/version"

Gem::Specification.new do |spec|
  spec.name        = "active-dbml"
  spec.version     = Active::Dbml::VERSION
  spec.authors     = ["ukmshi"]
  spec.email       = ["ukyo.mashiko@gmail.com"]
  spec.homepage    = "https://github.com/ukmshi/ActiveDBML"
  spec.summary     = "Active::DBML: A Gem for Bridging Database Design and Development"
  spec.description = "Active::DBML is a new, useful Ruby gem designed to streamline database development."
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", "~> 7"
end
