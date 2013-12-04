module Spree
  module Jirafe
    class Engine < ::Rails::Engine
      engine_name "spree_jirafe"

      config.autoload_paths += %W(#{config.root}/lib)

      initializer "spree_jirafe.environment", :before => :load_config_initializers do |app|
        Jirafe::Config = Spree::Jirafe::Configuration.new
      end
    end
  end
end
