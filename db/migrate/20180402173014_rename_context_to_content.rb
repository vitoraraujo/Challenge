class RenameContextToContent < ActiveRecord::Migration[5.0]
  def change
  	rename_column :challenges, :context, :content
    add_index :challenges, [:user_id, :created_at]

  end
end
