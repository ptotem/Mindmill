class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.integer :user_id
      t.integer :profile_parameter_id
      t.string :value

      t.timestamps
    end
  end
end
