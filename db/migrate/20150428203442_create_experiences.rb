class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.text :title
      t.text :period
      t.text :company
      t.text :description
      t.references :applicant, index: true

      t.timestamps
    end
  end
end
