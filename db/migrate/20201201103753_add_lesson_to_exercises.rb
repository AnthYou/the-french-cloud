class AddLessonToExercises < ActiveRecord::Migration[6.0]
  def change
    add_reference :exercises, :lesson, foreign_key: true
  end
end
