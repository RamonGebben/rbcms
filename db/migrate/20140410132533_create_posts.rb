class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.attachment :image
      t.text :lead

      t.timestamps
    end
  end
end
