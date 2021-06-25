class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|


      t.string :itemes_name ,        null: false 
      t.text :text  ,               null: false 
      t.references :user,           foreign_key: true
      t.integer :category_id ,      null: false
      t.integer :condition_id ,     null: false
      t.integer :delivery_charge_id,null: false
      t.integer :delivery_area_id, null: false
      t.integer :day_to_ship_id ,  null: false
      t.integer :price ,          null: false
      t.timestamps 
    end
  end
end
