class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :name
      t.integer :client_id
    end
    create_table :reviewimages do |t|
      t.integer :review_id
      t.integer :image_id
    end
  end
end
