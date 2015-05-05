class CreateTestmonials < ActiveRecord::Migration
  def change
    create_table :testmonials do |t|
      t.text :name
      t.text :company
      t.text :logo
      t.text :quote

      t.timestamps
    end
  end
end
