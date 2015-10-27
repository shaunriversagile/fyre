class CreateJoinTableDealershipResponseContacts < ActiveRecord::Migration
  def change
    create_table :dealership_response_contacts do |t|
      t.references :dealership_response_message, :dealership_contact
      t.timestamps
    end
  end
end
