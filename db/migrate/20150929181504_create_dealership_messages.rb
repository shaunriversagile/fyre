class CreateDealershipMessages < ActiveRecord::Migration
  def change
    create_table :dealership_messages do |t|
      t.string :message_code, :message_body, :phone_number
      t.integer :message_type
      t.references :dealership
      t.timestamps
    end
  end
end
