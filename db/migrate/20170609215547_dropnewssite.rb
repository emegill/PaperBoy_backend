class Dropnewssite < ActiveRecord::Migration[5.1]
  def change
       drop_table :news_sites
  end
end
