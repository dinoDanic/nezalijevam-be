class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.references :assignee, null: false
      t.references :assigned, null: false
      t.date :date, null: false
      t.boolean :watered, null: false

      t.timestamps
    end

   add_foreign_key :schedules, :users, column: :assignee_id
   add_foreign_key :schedules, :users, column: :assigned_id
  end
end
