class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.references :blog_id
      t.references :user_id
      t.string :title, :limit => 150
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
