class RemoveFeedid < ActiveRecord::Migration[5.1]
  def change
       remove_column :news_sites, :feed_id
  end
end
