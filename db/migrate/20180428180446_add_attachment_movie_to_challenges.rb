class AddAttachmentMovieToChallenges < ActiveRecord::Migration[5.0]
  def self.up
    change_table :challenges do |t|
      t.attachment :movie
    end
  end

  def self.down
    remove_attachment :challenges, :movie
  end
end
