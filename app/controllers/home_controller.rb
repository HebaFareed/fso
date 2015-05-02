class HomeController < ApplicationController
  def index
      if Job.count != 0
      @jobs = Job.all.order('created_at DESC').take(3)
      end
  end

  def women
   @q = Job.ransack(params[:q])
      @jobs = @q.result
  end
  def men
   @q = Job.ransack(params[:q])
      @jobs = @q.result
  end

  def fresh_graduate
@q = Job.ransack(params[:q])
      @jobs = @q.result
      end

  def experienced
@q = Job.ransack(params[:q])
      @jobs = @q.result
      end

      def internship
      @internships = Job.where('internship'=>true)
      if @internships.count != 0
        @jobs = @internships.all
      end
  end
end
