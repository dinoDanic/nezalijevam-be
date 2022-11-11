class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :date, null: false
      t.boolean :watered, null: false

      t.timestamps
    end
  end
end
