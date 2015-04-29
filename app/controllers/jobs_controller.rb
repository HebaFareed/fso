class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy, :request, :requests]
  before_action :require_employer, only: [:new, :edit]
  before_action(:only => [:edit, :destroy]) { |c| c.require_authority(params[:id]) }
  respond_to :html

  def index
    @jobs = Job.all
    respond_with(@jobs)
  end

  def show
       follower = Follow.where(["followable_id = ?", @job.id])
    follower_ids = follower.collect{|f| f.follower_id}
    @job_followers = Applicant.where(:id => follower_ids)
    respond_with(@job)
  end

  def new
    @job = Job.new
    respond_with(@job)
  end

  def edit
  end

  def create
    @job = Job.new(job_params)
    @job.employer = current_employer
    if @job.save
        if @job.internship
            redirect_to internship_employer_path(current_employer)
        else
            redirect_to job_employer_path(current_employer)
        end
    end
  end

  def update
    @job.update(job_params)
    if @job.save
        if @job.internship
            redirect_to internship_employer_path(current_employer)
        else
            redirect_to job_employer_path(current_employer)
        end
    end
  end

  def destroy
    @job.destroy
    respond_with(@job)
  end
    
  def create_follower
    @job = Job.find(params[:job_id])
    @applicant = current_applicant
    current_applicant.follow(@job)
    redirect_to @job
  end
 
  def destroy_follower
    @job = Job.find(params[:job_id])
    @applicant = current_applicant
    current_applicant.stop_following(@job)
  end
 
    
  def follower
    follower = Follow.where(["followable_id = ?", @job.id])
    follower_ids = follower.collect{|f| f.follower_id}
    @job_followers = Applicant.where(:id => follower_ids)
  end

  #private
    def set_job
      @job = Job.find(params[:id])
    end

    
    def require_employer
      unless (current_employer)
        redirect_to new_employer_registration_path, alert: "You can only edit this for your account."
      end
    end
    
    def require_authority(args)
       unless current_employer && (@job.employer == current_employer) 
        redirect_to root_path, alert: "You can only edit this for your account."
      end 
    end

    def job_params
       params.require(:job).permit(:title, :experience, :field, :place, :internship, :description)
    end
end
