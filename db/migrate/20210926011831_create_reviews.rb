class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :client_id
      t.text :content
      t.date :visited
      t.integer :note
t.timestamps
    end
  end
end
