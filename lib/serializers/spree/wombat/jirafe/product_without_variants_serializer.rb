require 'active_model/serializer'

module Spree
  module Wombat
    module Jirafe

      class ProductWithoutVariantsSerializer < Wombat::ProductSerializer

        attributes :meta_data, :created_at, :updated_at

        def meta_data
          {
            :jirafe => ActiveModel::ArraySerializer.new(object.taxons,
              each_serializer: Spree::Wombat::Jirafe::TaxonSerializer,
              root: "taxons"
            )
          }
        end

        def created_at
          object.created_at.getutc.try(:iso8601)
        end

        def updated_at
          object.updated_at.getutc.try(:iso8601)
        end


      end

    end
  end
end
