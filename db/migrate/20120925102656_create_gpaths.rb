class CreateGpaths < ActiveRecord::Migration
  def change
    create_table :gpaths do |t|
      t.integer :gnode_id
      t.string :name
      t.text :markup
      t.integer :next_id

      t.timestamps
    end
  end
end
