class ChangeNewsTableName < ActiveRecord::Migration[5.1]
  def change

      rename_table :news, :articles

  end
end
