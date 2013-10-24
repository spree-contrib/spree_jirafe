module Spree
  module Jirafe
    class Configuration < Spree::Preferences::Configuration
      preference :site_id, :integer
      preference :access_token, :string
    end
  end
end
