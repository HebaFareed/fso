class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.text :title
      t.text :experience
      t.text :field
      t.text :place
      t.text :description
      t.boolean :internship, default: false
      t.references :employer, index: true


      t.timestamps
    end
  end
end
