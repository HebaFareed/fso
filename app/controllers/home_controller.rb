class HomeController < ApplicationController
  def index
      if Job.count != 0
        @jobs = Job.all.order('created_at DESC').take(4)
      end

  end

  def women_jobs
    @q = Job.where(:sex => "female").ransack(params[:q])
    @jobs = @q.result
  end

  def men_jobs
    @q = Job.where(:sex => "male").ransack(params[:q])
    @jobs = @q.result
  end

  def women_applicants
    @q = Applicant.where(:sex => "female").ransack(params[:q])
    @applicants = @q.result
  end

  def men_applicants
    @q = Applicant.where(:sex => "male").ransack(params[:q])
    @applicants = @q.result
  end

  def fresh_graduate
    @q = Job.where(:applicant_status => "fresh-graduate").ransack(params[:q])
    @jobs = @q.result
  end

  def experienced
    @q = Job.where(:applicant_status => "experienced").ransack(params[:q])
    @jobs = @q.result
  end

      def internship
      @internships = Job.where('internship'=>true)
      if @internships.count != 0
        @jobs = @internships.all
      end
  end
end
