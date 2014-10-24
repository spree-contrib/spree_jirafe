require 'active_model/serializer'
require 'spree/wombat/line_item_serializer'

module Spree
  module Wombat
    module Jirafe
      
      class LineItemSerializer < Spree::Wombat::LineItemSerializer
        attributes :created_at, :updated_at, :variant

        def created_at
          object.created_at.getutc.try(:iso8601)
        end

        def updated_at
          object.updated_at.getutc.try(:iso8601)
        end

        def variant
          Spree::Wombat::Jirafe::VariantSerializer.new(object.variant, root:false)
        end
      end
    end
  end
end
