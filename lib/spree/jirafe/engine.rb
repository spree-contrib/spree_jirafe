module Spree
  module Jirafe
    class Engine < ::Rails::Engine
      require 'spree/core'
      engine_name "spree_jirafe"
      
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
          product_serializer_path = nil
          Dir.glob(File.join(File.dirname(__FILE__), "../../../lib/**/*_serializer.rb")) do |serializer|
            if serializer.match /product_serializer.rb/
              product_serializer_path = serializer
            else
              Rails.configuration.cache_classes ? require(serializer) : load(serializer)
            end
          end
          #load the product_serializer.rb last, since it is subclassing a file
          # that is loaded later.
          Rails.configuration.cache_classes ? require(product_serializer_path) : load(product_serializer_path)
        end

      end

      config.to_prepare &method(:activate).to_proc
    end
  end
end
