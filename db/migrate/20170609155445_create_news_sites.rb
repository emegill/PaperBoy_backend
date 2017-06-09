class CreateNewsSites < ActiveRecord::Migration[5.1]
  def change
    create_table :news_sites do |t|
      t.string :source

      t.timestamps
    end
  end
end
