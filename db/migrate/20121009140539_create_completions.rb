class CreateCompletions < ActiveRecord::Migration
  def change
    create_table :completions do |t|
      t.integer :gnode_id
      t.integer :user_id
      t.integer :attempts

      t.timestamps
    end
  end
end
