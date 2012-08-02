class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :name
      t.text :description
      t.text :address
      t.integer :phone
      t.string :email
      t.string :web
      t.string :nit

      t.timestamps
    end
  end
end
