class CreatePageviews < ActiveRecord::Migration
  def change
    create_table :pageviews do |t|
      t.integer :post_id
      t.string :user_ip

      t.timestamps
    end
  end
end
