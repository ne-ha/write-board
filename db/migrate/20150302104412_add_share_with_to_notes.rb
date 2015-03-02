class AddShareWithToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :share_with, :text
  end
end
