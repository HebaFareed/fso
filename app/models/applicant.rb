# encoding: utf-8
class Applicant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 acts_as_follower
 has_many :skill, :dependent => :destroy
    accepts_nested_attributes_for :skill, :reject_if => :all_blank, :allow_destroy => true
 belongs_to :job
 has_many :education, :dependent => :destroy
    accepts_nested_attributes_for :education, :reject_if => :all_blank, :allow_destroy => true
 has_many :experience, :dependent => :destroy
    accepts_nested_attributes_for :experience, :reject_if => :all_blank, :allow_destroy => true
 has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  has_attached_file :cv, :url => "/:class/:attachment/:id/:basename.:extension", :path => ":rails_root/public/:class/:attachment/:id/:basename.:extension"
  validates_attachment :cv, :content_type => { :content_type => "application/pdf" }, :size => { :in => 0..5.megabytes }



 validates_presence_of :first_name, :message => "من فضلك اكتب الاسم الأول"
 validates_presence_of :second_name, :message => "من فضلك اكتب اسم العائلة"
 validates_presence_of :sex, :message => "من فضلك حدد النوع"
validates_presence_of :status,:message => "من فضلك حدد حالتك: خريج، أم صاحب خبرة"
validates_presence_of :phone, :message => "من فضلك اكتب رقم الهاتف"
validates_presence_of :city, :message => "من فضلك اختر المدينة"

end
