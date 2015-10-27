class CreateDealerships < ActiveRecord::Migration
  def change
    create_table :dealerships do |t|
      t.string :name, :dealership_code,:street_address, :city, :state, :zip_code, :email, :phone_number, :twilio_number
      t.timestamps
    end
    add_index :dealerships, :dealership_code, unique: true
  end
end
