# encoding: utf-8
class Job < ActiveRecord::Base
  belongs_to :employer
  acts_as_followable

    validates_presence_of :title, :messege => "من فضلك اكتب الوظيفة"
    validates_presence_of :place, :messege => "من فضلك اكتب المكان"
    validates_presence_of :sex, :messege => "من فضلك حدد النوع"
    validates_presence_of :applicant_status,  :messege => "من فضلك حدد الحالة"
end
