class AddDateToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :date, :string
  end
end
