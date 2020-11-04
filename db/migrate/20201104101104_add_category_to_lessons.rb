class AddCategoryToLessons < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :category, :string
  end
end
