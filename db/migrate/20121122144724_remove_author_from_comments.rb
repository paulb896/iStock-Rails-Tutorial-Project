class RemoveAuthorFromComments < ActiveRecord::Migration
  def up
    remove_column :comments, :author_id
  end

  def down
    add_column :comments, :author_id, :integer
  end
end
