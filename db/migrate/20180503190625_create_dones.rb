class CreateDones < ActiveRecord::Migration[5.0]
  def change
    create_table :dones do |t|
      t.integer :user_id
      t.integer :challenge_id

      t.timestamps
    end
  end
end
