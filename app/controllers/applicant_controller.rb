# encoding: utf-8
class ApplicantController < ApplicationController
  before_action(:except => [:index, :new, :create]) { |c| c.prepare_applicant(params[:id]) }
  
    
  def index
    
    
    
      @search = Sunspot.search(Applicant) do
        fulltext params[:query]
        facet :status
        with(:status, params[:status]) if params[:status].present?
        facet :sex
        with(:sex, params[:sex]) if params[:sex].present?
        facet :city
        with(:city, params[:city]) if params[:city].present?
        paginate(:page => (params[:page] or 1), :per_page => 10)
      end
        if @search
        @applicants_results = @search.results
        else
            @applicants_results = "no results!"
        end
        @applicants = Applicant.all
    

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
