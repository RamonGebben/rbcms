class AddStaticToPost < ActiveRecord::Migration
  def change
    add_column :posts, :static, :string
  end
end
