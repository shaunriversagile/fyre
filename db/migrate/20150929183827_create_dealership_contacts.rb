class CreateDealershipContacts < ActiveRecord::Migration
  def change
    create_table :dealership_contacts do |t|
      t.string :first_name, :last_name, :email, :phone_number
      t.boolean :send_lead_text, :send_lead_email
      t.references :dealership
    end
  end
end
