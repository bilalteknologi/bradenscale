class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.longtext :answer
      t.integer :value
      t.integer :question_id

      t.timestamps

    end
    change_column :answers, :question_id, :bigint

    add_foreign_key :answers, :questions, on_delete: :cascade

  end
end
