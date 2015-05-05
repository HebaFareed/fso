class AddAttachmentCvToApplicants < ActiveRecord::Migration
  def self.up
    change_table :applicants do |t|
      t.attachment :cv
    end
  end

  def self.down
    remove_attachment :applicants, :cv
  end
end
