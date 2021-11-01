class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :comment_plot_id
      t.integer :comment_user_id
      t.string :comment_text
      t.datetime :comment_date

      t.timestamps
    end
  end
end
