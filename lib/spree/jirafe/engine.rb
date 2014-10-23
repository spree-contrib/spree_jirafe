module Spree
  module Jirafe
    class Engine < ::Rails::Engine
      require 'spree/core'
      engine_name "spree_jirafe"
      isolate_namespace Spree
      config.autoload_paths += %W(#{config.root}/lib)
      config.autoload_paths += %W(#{config.root}/app/controllers)

      initializer "spree_jirafe.environment", :before => :load_config_initializers do |app|
        Jirafe::Config = Spree::Jirafe::Configuration.new
      end

      def self.activate
        Dir.glob(File.join(File.dirname(__FILE__), '../../../app/**/*_decorator*.rb')) do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end

        if ::Rails::Engine.subclasses.map(&:name).include? "Spree::Wombat::Engine"
          Dir.glob(File.join(File.dirname(__FILE__), "../../lib/**/*_serializer.rb")) do |serializer|
            Rails.env.production? ? require(serializer) : load(serializer)
          end
        end

      end

      config.to_prepare &method(:activate).to_proc
    end
  end
end
