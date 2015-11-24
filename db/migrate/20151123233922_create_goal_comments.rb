class CreateGoalComments < ActiveRecord::Migration
  def change
    create_table :goal_comments do |t|
      t.string :body, null: false
      t.integer :author_id, null: false
      t.integer :goal_id, null: false

      t.timestamps null: false
    end
    add_index :goal_comments, :author_id
    add_index :goal_comments, :goal_id
  end
end
