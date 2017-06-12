class CreateNewssites < ActiveRecord::Migration[5.1]
  def change
    create_table :newssites do |t|
        t.integer :news_id
        t.string :source
      t.timestamps
    end
  end
end
