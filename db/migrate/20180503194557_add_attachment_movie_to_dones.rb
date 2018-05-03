class AddAttachmentMovieToDones < ActiveRecord::Migration[5.0]
  def self.up
    change_table :dones do |t|
      t.attachment :movie
    end
  end

  def self.down
    remove_attachment :dones, :movie
  end
end
