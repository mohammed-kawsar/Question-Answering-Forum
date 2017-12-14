class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
    add_index :questions, [:user_id, :created_at]
  end
end
