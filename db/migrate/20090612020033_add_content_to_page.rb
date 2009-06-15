class AddContentToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :content, :text
  end

  def self.down
    remove_column :pages, :content
  end
end
