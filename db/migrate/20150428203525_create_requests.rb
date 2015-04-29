class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.boolean :accepted
      t.references :applicant, index: true
      t.references :job, index: true

      t.timestamps
    end
  end
end
