class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.text :degree
      t.text :field
      t.text :graduation_year
      t.text :graduation_place
      t.references :applicant, index: true

      t.timestamps
    end
  end
end
