class RemoveColumnFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :comment_date, :string
  end
end
