class RenameContextToContent < ActiveRecord::Migration[5.0]
  def change
  	rename_column :challenges, :context, :content
  end
end
