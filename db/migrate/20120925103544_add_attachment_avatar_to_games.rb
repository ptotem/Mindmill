class AddAttachmentAvatarToGames < ActiveRecord::Migration
  def self.up
    change_table :games do |t|
      t.has_attached_file :avatar
    end
  end

  def self.down
    drop_attached_file :games, :avatar
  end
end
