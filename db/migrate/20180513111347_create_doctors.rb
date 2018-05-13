class CreateDoctors < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :phone
      t.string :specialization

      t.timestamps
    end
  end
end
