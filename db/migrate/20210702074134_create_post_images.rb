class CreatePostImages < ActiveRecord::Migration[5.0]
  def change
    create_table :post_images do |t|
      t.string :image_id
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
