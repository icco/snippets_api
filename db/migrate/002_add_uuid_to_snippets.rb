class AddUuidToSnippets < ActiveRecord::Migration
  def self.up
    change_table :snippets do |t|
      t.string :uuid
    end
  end

  def self.down
    change_table :snippets do |t|
      t.remove :uuid
    end
  end
end
