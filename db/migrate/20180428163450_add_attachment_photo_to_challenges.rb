class AddAttachmentPhotoToChallenges < ActiveRecord::Migration[5.0]
  def self.up
    change_table :challenges do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :challenges, :photo
  end
end
