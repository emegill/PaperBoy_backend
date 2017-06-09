class AddUserIdToFeedRemoveNewsId < ActiveRecord::Migration[5.1]
  def change
      add_column :feeds, :user_id, :integer
      remove_column :feeds, :news_id
  end
end
