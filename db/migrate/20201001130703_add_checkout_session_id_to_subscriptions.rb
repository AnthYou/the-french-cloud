class AddCheckoutSessionIdToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptions, :checkout_session_id, :string
  end
end
