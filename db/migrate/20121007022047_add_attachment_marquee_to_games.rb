class AddAttachmentMarqueeToGames < ActiveRecord::Migration
  def self.up
    change_table :games do |t|
      t.has_attached_file :marquee
    end
  end

  def self.down
    drop_attached_file :games, :marquee
  end
end
