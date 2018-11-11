class CreateDecisions < ActiveRecord::Migration[5.2]
  def change
    create_table :decisions do |t|
      t.integer :begin_value
      t.integer :end_value
      t.longtext :decision
      t.string :title

      t.timestamps
    end
  end
end
