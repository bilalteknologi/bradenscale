class AddUserIdToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :user_id, :integer
    change_column :transactions, :user_id, :bigint

    add_foreign_key :transactions, :users, on_delete: :cascade
  end
end
