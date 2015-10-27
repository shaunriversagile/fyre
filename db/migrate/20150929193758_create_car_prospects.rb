class CreateCarProspects < ActiveRecord::Migration
  def change
    create_table :car_prospects do |t|
      t.references :car, :prospect
      t.timestamps
    end
  end
end
