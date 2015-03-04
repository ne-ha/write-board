class AddOwnerToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :owner, :boolean, :default => false
  end
end
