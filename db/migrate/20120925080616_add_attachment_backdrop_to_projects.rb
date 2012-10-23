class AddAttachmentBackdropToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.has_attached_file :backdrop
    end
  end

  def self.down
    drop_attached_file :projects, :backdrop
  end
end
