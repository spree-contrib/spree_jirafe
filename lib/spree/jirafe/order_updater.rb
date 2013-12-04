module Spree
  module Jirafe
    class OrderUpdater
      attr_reader :order, :action_name, :cookie_data

      def initialize(order, action_name, cookie_data)
        @order = order
        @action_name = action_name
        @cookie_data = cookie_data
      end

      def perform!
        order.visit_id         = cookie_data['jirafe_vis'].to_i || 0
        order.visitor_id       = cookie_data['jirafe_vid'].to_i || 0
        order.pageview_id      = cookie_data['jirafe_pvid'].to_i || 0
        order.last_pageview_id = cookie_data['jirafe_lpvid').to_i || 0

        @order.save if action_name == :new || action_name == :populate
      end
    end
  end
end
