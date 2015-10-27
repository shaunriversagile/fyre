class AddDefaultValueToHasBeenCalled < ActiveRecord::Migration
  def change
    change_column :prospects, :has_been_called, :boolean, :null => false, :default => false
  end
end
