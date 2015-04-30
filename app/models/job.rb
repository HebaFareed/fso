class Job < ActiveRecord::Base
  belongs_to :employer
  acts_as_followable
    

end
