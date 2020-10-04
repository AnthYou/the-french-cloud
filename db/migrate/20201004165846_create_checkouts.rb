class CreateCheckouts < ActiveRecord::Migration[6.0]
  def change
    create_table :checkouts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :state
      t.string :checkout_session_id
      t.references :plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
