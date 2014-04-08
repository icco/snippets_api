class CreateSnippets < ActiveRecord::Migration
  def self.up
    create_table :snippets do |t|
      t.text :text
      t.string :user_id
      t.datetime :created
    end
  end

  def self.down
    drop_table :snippets
  end
end
