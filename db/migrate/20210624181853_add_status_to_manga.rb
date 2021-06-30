class AddStatusToManga < ActiveRecord::Migration[6.1]
  def change
    add_column :mangas, :status, :string
  end
end
