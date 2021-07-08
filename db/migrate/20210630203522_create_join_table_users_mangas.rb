class CreateJoinTableUsersMangas < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :mangas do |t|
      # t.index [:user_id, :manga_id]
      # t.index [:manga_id, :user_id]
    end
  end
end
