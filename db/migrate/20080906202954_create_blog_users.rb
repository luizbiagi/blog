class CreateBlogUsers < ActiveRecord::Migration
  def self.up
    create_table :blog_users do |t|
      t.references :blog_id
      t.references :user_id
      t.integer :level, :limit => 1
    end
  end

  def self.down
    drop_table :blog_users
  end
end
