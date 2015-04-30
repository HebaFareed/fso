class Job < ActiveRecord::Base
  belongs_to :employer
  acts_as_followable
    
  searchable do
      text :title
      text :place
      text :field
      text :experience
      text :description
      text :employer
  end
end
