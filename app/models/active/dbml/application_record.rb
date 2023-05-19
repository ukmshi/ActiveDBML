module Active
  module Dbml
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
