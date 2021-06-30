class CreateMangas < ActiveRecord::Migration[6.1]
  def change
    create_table :mangas do |t|
      t.string :title, :null => false
      t.string :author
      t.integer :year_release
      t.string :image
      t.string :last_chapter
      t.string :link, :null => false

      t.timestamps
    end
  end
end
