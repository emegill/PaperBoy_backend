class AddUseridToWebsites < ActiveRecord::Migration[5.1]
  def change
      add_column :news_sites, :feed_id, :integer
      
  end
end
