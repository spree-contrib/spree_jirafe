Spree::Admin::OrdersController.class_eval do
  after_filter  :set_jirafe_visit_attributes, only: :new
  before_filter :set_jirafe_visit_attributes, only: [:create, :update]

  private

  def set_jirafe_visit_attributes
    Spree::Jirafe::OrderUpdater.new(@order, action, cookies).perform!
  end
end
