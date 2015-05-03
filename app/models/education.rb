class Education < ActiveRecord::Base
  belongs_to :applicant

  validates_presence_of :field, :graduation_year, :graduation_place
end
