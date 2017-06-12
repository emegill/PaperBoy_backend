class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
        t.string :title
        t.string :author
        t.string :content
        t.text :url

      t.timestamps
    end
  end
end
