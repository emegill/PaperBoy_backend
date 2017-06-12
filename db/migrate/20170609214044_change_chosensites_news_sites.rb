class ChangeChosensitesNewsSites < ActiveRecord::Migration[5.1]
  def change
      remove_column :chosensites, :news_sites_id
      add_column :chosensites, :newssites_id, :integer
  end
end
