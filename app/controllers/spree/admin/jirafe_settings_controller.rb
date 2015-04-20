module Spree
  module Admin
    class JirafeSettingsController < Admin::BaseController

      def edit
      end

      def update
        Spree::Jirafe::Config[:site_id] = params[:site_id]
        Spree::Jirafe::Config[:access_token] = params[:access_token]
        flash[:success] = Spree.t(:successfully_updated, :resource => Spree.t(:jirafe_settings))

        render :edit
      end

    end
  end
end
