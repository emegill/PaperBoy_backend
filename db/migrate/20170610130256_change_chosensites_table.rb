class ChangeChosensitesTable < ActiveRecord::Migration[5.1]
  def change
      remove_column :chosensites, :newssites_id
      add_column :chosensites, :newssite_id, :integer
  end
end
