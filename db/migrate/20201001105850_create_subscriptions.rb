class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :active, default: false
      t.datetime :current_period_ends_at
      t.string :stripe_id
      t.references :plan, null: false, foreign_key: true
      t.string :stripe_plan_id

      t.timestamps
    end
  end
end
