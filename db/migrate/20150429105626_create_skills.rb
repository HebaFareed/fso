class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.text :skill
      t.references :applicant, index: true

      t.timestamps
    end
  end
end
