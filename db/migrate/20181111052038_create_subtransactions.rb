class CreateSubtransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :subtransactions do |t|
      t.integer :answer_id
      t.integer :transaction_id

      t.timestamps


    end
    change_column :subtransactions, :transaction_id, :bigint
    change_column :subtransactions, :answer_id, :bigint
    add_foreign_key :subtransactions, :transactions, on_delete: :cascade      
    add_foreign_key :subtransactions, :answers, on_delete: :cascade      

  end
end
