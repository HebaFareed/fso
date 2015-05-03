class Job < ActiveRecord::Base
  belongs_to :employer
  acts_as_followable

    validates_presence_of :title, :place, :sex, :applicant_status
end
