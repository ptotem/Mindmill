class AddAttachmentAvatarToGnodes < ActiveRecord::Migration
  def self.up
    change_table :gnodes do |t|
      t.has_attached_file :avatar
    end
  end

  def self.down
    drop_attached_file :gnodes, :avatar
  end
end
