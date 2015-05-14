class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.text :who
      t.text :copyrights

      t.timestamps
    end
  end
end
