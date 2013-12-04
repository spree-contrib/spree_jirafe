Spree::CheckoutController.class_eval do
  before_filter :set_jirafe_visit_attributes, only: :update

  private

  def set_jirafe_visit_attributes
    return unless @order
    @order.visit_id = cookies['jirafe_vis'].to_i || 0
    @order.visitor_id = cookies['jirafe_vid'].to_i || 0
  end
end
