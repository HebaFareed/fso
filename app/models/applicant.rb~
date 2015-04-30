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
    
  searchable do
    text :education_field do
        education.map { |education| education.field }
    end
      
    text :experience_field do
        experience.map { |experience| experience.title }
    end

    text :experience_desc do
        experience.map { |experience| experience.description }
    end
    text :skill_array do
        skill.map { |skill| skill.skill }
    end
    string :status
    string :sex
    string :city
  end
end
