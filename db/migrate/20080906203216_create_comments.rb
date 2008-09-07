class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.references :post_id
      t.references :user_id
      t.text :body
			t.datetime :created_at
    end
  end

  def self.down
    drop_table :comments
  end
end
