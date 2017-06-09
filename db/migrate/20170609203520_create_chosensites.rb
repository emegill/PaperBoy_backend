class CreateChosensites < ActiveRecord::Migration[5.1]
  def change
    create_table :chosensites do |t|
        t.integer :news_sites_id
        t.integer :feed_id

      t.timestamps
    end
  end
end
