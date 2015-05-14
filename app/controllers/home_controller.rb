class HomeController < ApplicationController
  def index
      if Job.count != 0
        @jobs = Job.all.order('created_at DESC').take(4)
      end

      if Testmonial.count != 0
        @testmonials = Testmonial.all
      end

  end

  def women_jobs
    @q = Job.where(:sex => "female").ransack(params[:q])
    @jobs = @q.result.order('created_at DESC')
  end

  def men_jobs
    @q = Job.where(:sex => "male").ransack(params[:q])
    @jobs = @q.result.order('created_at DESC')
  end

  def women_applicants
    @q = Applicant.where(:sex => "female").ransack(params[:q])
    @applicants = @q.result.order('created_at DESC')
  end

  def men_applicants
    @q = Applicant.where(:sex => "male").ransack(params[:q])
    @applicants = @q.result.order('created_at DESC')
  end

  def fresh_graduate_jobs
    @q = Job.where(:applicant_status => "fresh-graduate").ransack(params[:q])
    @jobs = @q.result.order('created_at DESC')
  end

  def fresh_graduate_applicants
    @q = Applicant.where(:applicant_status => "fresh-graduate").ransack(params[:q])
    @applicants = @q.result.order('created_at DESC')
  end

  def experienced
    @q = Job.where(:applicant_status => "experienced").ransack(params[:q])
    @jobs = @q.result.order('created_at DESC')
  end

  def about
    @about = About.first
  end

      def internship
      @internships = Job.where('internship'=>true)
      if @internships.count != 0
        @jobs = @internships.all
      end
  end
end
