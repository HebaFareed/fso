# encoding: utf-8
class ApplicantsController < ApplicationController
  before_action(:except => [:index, :new, :create]) { |c| c.prepare_applicant(params[:id]) }


  def index
            @q = Applicant.ransack(params[:q])
            @applicants = @q.result.includes(:education, :experience, :skill).order('created_at DESC')
  end

  def show
  end

  def following
    following = Follow.where(["follower_id = ?", current_applicant])
    following_ids = following.collect{|f| f.followable_id}
    @applicant_following = Job.where(:id => following_ids)
  end

  def after_sign_up_path_for(applicant)
        if @applicant.paid_account
          redirect_to new_payment_path
        else
            redirect_to @applicant
        end

  end
  def prepare_applicant(args)
      @applicant = Applicant.find(args)
      unless @applicant
        redirect_to root_path, alert: "Something went wrong!"
      end
  end
end
