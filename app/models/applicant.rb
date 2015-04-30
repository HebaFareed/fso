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

    
     # It returns the articles whose titles contain one or more words that form the query
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("status like ?", "%#{query}%") 




  end
end
