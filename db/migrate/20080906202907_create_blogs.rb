class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.string :name, :limit => 100
      t.string :address, :limit => 50, :unique => true
      t.text :description
      t.binary :icon
      t.references :template_id

      t.timestamps
    end
  end

  def self.down
    drop_table :blogs
  end
end
