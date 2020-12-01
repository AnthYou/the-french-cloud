class AddNatureToExercises < ActiveRecord::Migration[6.0]
  def change
    add_column :exercises, :nature, :string
  end
end
