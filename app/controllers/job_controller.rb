# encoding: utf-8
class JobController < ApplicationController
  before_action :authenticate_logging_in, only: [:edit, :update]
  before_action(:except => [:index, :new, :create]) { |c| c.prepare_job(params[:id]) }

  def index
    @job = Job.all
  end

  def show
    
  end

  def edit
  end

  def update
    @job.update_attributes(params[:job].permit!)
    redirect_to @job, notice: "تم تعديل الوظيفة بنجاح"
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(params[:job].permit!)
    @job.employer = current_employer
    if @job.save
      redirect_to @job
    else
      flash[:notice] = @job.errors.full_messages
      flash[:alert] = "الرجاء ادخال بيانات صحيحة"
      render 'new'

    end
  end



  # private
    def authenticate_logging_in
      unless employer_signed_in? || current_employer
        redirect_to root_path, alert: "يجب عليك التسجيل أولاً!"
      end
    end

    def require_authority(args)
      unless (current_employer && (@job.employer == current_employer) )
        redirect_to root_path, alert: "لا تستطيع تعديل هذا الحساب."
      end
    end

    def prepare_job(args)
      @job = Job.find(args)
      unless @job
        redirect_to root_path, alert: "هناك مشكلة ما!"
      end
    end
end
