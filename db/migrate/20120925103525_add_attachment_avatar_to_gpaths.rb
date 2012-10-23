class AddAttachmentAvatarToGpaths < ActiveRecord::Migration
  def self.up
    change_table :gpaths do |t|
      t.has_attached_file :avatar
    end
  end

  def self.down
    drop_attached_file :gpaths, :avatar
  end
end
