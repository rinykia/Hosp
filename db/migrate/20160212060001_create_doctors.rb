class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.integer :year
      t.string :title
      t.integer :hospitals, array: true, default: []
    end
  end
end
