class AddStripeIdToPlans < ActiveRecord::Migration[6.0]
  def change
    add_column :plans, :stripe_id, :string
    add_column :plans, :stripe_price_id, :string
  end
end
