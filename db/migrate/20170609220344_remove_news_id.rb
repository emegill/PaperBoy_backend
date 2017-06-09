class RemoveNewsId < ActiveRecord::Migration[5.1]
  def change
      remove_column :newssites, :news_id
      add_column :news, :newssites_id, :integer
  end
end
