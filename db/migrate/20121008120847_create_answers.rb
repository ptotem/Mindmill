class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :gnode_id
      t.text :matter

      t.timestamps
    end
  end
end
