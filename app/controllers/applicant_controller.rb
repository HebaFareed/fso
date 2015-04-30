# encoding: utf-8
class ApplicantController < ApplicationController
  before_action(:except => [:index, :new, :create]) { |c| c.prepare_applicant(params[:id]) }
  
    
  def index
    
      
        if params[:search]

            @applicants = Applicant.search(params[:search])
        else
            @applicants = Applicant.all
        end
        
    

  end

  def show
  end

  def following
    following = Follow.where(["follower_id = ?", current_applicant])
    following_ids = following.collect{|f| f.followable_id}
    @applicant_following = Job.where(:id => following_ids)
  end
    
  def after_sign_in_path_for(applicant)
    profile_applicant_path(applicant)
  end
  def prepare_applicant(args)
      @applicant = Applicant.find(args)
      unless @applicant
        redirect_to root_path, alert: "Something went wrong!"
      end
  end
end
