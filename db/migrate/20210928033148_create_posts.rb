class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :title
      t.text :othercontent
      t.integer :bookshopper_id
    end
  end
end
