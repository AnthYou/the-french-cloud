class AddPlanIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :plan, foreign_key: true
  end
end
