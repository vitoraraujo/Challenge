class AddAttachmentPhotoToDones < ActiveRecord::Migration[5.0]
  def self.up
    change_table :dones do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :dones, :photo
  end
end
