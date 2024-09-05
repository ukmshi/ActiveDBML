# frozen_string_literal: true

require_relative "dbml/version"
require_relative "dbml/generator/base"
require_relative "dbml/generator/mysql"
require_relative "dbml/generator/postgresql"

module Active
  module DBML
    class Error < StandardError; end
    # Your code goes here...
  end
end
