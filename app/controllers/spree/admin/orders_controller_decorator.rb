Spree::Admin::OrdersController.class_eval do
  after_filter  :set_jirafe_visit_attributes, only: :new
  before_filter :set_jirafe_visit_attributes, only: [:create, :update]

  private

  def set_jirafe_visit_attributes
    return unless @order
    @order.visit_id = cookies['jirafe_vis'].to_i || 0
    @order.visitor_id = cookies['jirafe_vid'].to_i || 0

    @order.save if action == :new
  end
end
