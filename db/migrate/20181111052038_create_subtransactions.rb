class CreateSubtransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :subtransactions do |t|
      t.integer :answer_id
      t.integer :transaction_id

      t.timestamps
    end
  end
end
