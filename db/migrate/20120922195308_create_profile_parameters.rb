class CreateProfileParameters < ActiveRecord::Migration
  def change
    create_table :profile_parameters do |t|
      t.string :name

      t.timestamps
    end
  end
end
