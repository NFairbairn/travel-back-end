class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :preview
      t.string :content
      t.integer :blog_id
      t.integer :location_id

      t.timestamps
    end
  end
end
