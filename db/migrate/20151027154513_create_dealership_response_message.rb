class CreateDealershipResponseMessage < ActiveRecord::Migration
  def change
    create_table :dealership_response_messages do |t|
      t.references :dealership_message
      t.references :dealership_contact
      t.string :message_body
    end
  end
end
