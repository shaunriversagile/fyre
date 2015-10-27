class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :stock_id, :make, :model, :year, :link, :bitly_link
      t.references :dealership
      t.references :dealership_message
      t.timestamps
    end
  end
end
