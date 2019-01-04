class AddDecisionIdToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :decision_id, :integer, null: true
    change_column :transactions, :decision_id, :bigint, null: true

    add_foreign_key :transactions, :decisions, on_delete: :cascade
  end
end
