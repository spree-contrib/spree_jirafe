module Spree
  module Jirafe
    class Engine < ::Rails::Engine
      require 'spree/core'
      engine_name "spree_jirafe"
      isolate_namespace Spree
      config.autoload_paths += %W(#{config.root}/app/models)

      initializer "spree_jirafe.environment", :before => :load_config_initializers do |app|
        Jirafe::Config = Spree::Jirafe::Configuration.new
      end

      def self.activate
        Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end
      end

      config.to_prepare &method(:activate).to_proc
    end
  end
end
