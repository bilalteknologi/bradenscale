class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :name
      t.integer :age
      t.date :checkin_date
      t.string :gender
      t.string :ruangan
      t.string :doctor
      t.string :medic_record_number
      t.string :bed_number
      t.integer :score

      t.timestamps
    end
  end
end
