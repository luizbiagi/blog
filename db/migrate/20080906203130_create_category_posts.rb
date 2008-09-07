class CreateCategoryPosts < ActiveRecord::Migration
  def self.up
    create_table :category_posts do |t|
      t.references :category_id
      t.references :post_id
    end
  end

  def self.down
    drop_table :category_posts
  end
end
