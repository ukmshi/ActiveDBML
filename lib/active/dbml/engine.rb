module Active
  module Dbml
    class Engine < ::Rails::Engine
      isolate_namespace Active::Dbml
    end
  end
end
