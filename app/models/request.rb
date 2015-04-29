class Request < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :job
end
