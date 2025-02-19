class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false, limit: 40
      t.string :content, null: false
      t.string :author, null: false
      t.string :category, null: false
      t.date :published_at, null: false
    end
  end
end
