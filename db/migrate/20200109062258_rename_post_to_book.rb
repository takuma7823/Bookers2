class RenamePostToBook < ActiveRecord::Migration[5.2]
  def change
  	rename_table :posts, :books
  end
end
