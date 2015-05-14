# encoding: utf-8
class Employer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :job, :dependent => :destroy
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates_presence_of :first_name, :messege => "من فضلك اكتب الاسم الأول"
  validates_presence_of :second_name, :messege => "من فضلك اكتب اسم العائلة"
  validates_presence_of :email, :messege => "من فضلك اكتب البريد الإلكتروني"
  validates_presence_of :password, :messege => "من فضلك اكتب كلمة السر"
  validates_presence_of :phone, :messege => "من فضلك اكتب رقم الهاتف"
  validates_presence_of :co_name, :messege => "من فضلك اكتب اسم الشركة"
  validates_presence_of :co_address, :messege => "من فضلك اكتب عنوان الشركة"
  validates_presence_of :co_type, :messege => "من فضلك اكتب نوع الشركة"
  validates_presence_of :co_desc, :messege => "من فضلك اكتب وصف الشركة"
  validates_presence_of :paid_account
end
