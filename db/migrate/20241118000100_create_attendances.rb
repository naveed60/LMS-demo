class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.references :enrollment, null: false, foreign_key: true
      t.date :date, null: false
      t.string :status, null: false, default: "present"

      t.timestamps
    end

    add_index :attendances, [:enrollment_id, :date], unique: true
  end
end

