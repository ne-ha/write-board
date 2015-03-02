class AddOwnerToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :owner, :boolean
  end
end
