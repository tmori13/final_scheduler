class CreateFinals < ActiveRecord::Migration[5.1]
  def change
    create_table :finals do |t|
      t.string :course_identifier
      t.string :section
      t.string :course_name
      t.string :instructor
      t.string :start_time
      t.string :end_time
      t.string :day
      t.string :date
      t.string :room

      t.timestamps
    end
  end
end
