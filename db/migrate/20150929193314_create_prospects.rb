class CreateProspects < ActiveRecord::Migration
  def change
    create_table :prospects do |t|
      t.string :phone_number
      t.boolean :has_been_called
      t.timestamps
    end
  end
end
