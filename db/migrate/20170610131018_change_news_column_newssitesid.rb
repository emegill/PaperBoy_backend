class ChangeNewsColumnNewssitesid < ActiveRecord::Migration[5.1]
  def change
      remove_column :news, :newssites_id
      add_column :news, :newssite_id, :integer
  end
end
