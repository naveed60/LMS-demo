class CreateFees < ActiveRecord::Migration[7.0]
  def change
    create_table :fees do |t|
      t.references :student, null: false, foreign_key: true
      t.decimal :amount, precision: 10, scale: 2, null: false, default: 0
      t.date :due_date
      t.date :paid_on
      t.string :status, null: false, default: "unpaid"
      t.string :description

      t.timestamps
    end
  end
end

