class RemoveColumnsFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :comment_plot_id, :integer
    remove_column :comments, :comment_user_id, :integer
  end
end
