class HomeController < ApplicationController
  def index
      if Job.count != 0
      @jobs = Job.all.order('created_at DESC').take(3)
      end
  end
    
  def women
   if Job.count != 0
      @jobs = Job.all
      end
  end
    
  def fresh_graduate
if Job.count != 0
      @jobs = Job.all
      end  end
    
  def experienced
if Job.count != 0
      @jobs = Job.all
      end  end
    
      def internship
      @internships = Job.where('internship'=>true)
      if @internships.count != 0
        @jobs = @internships.all
      end
  end
end
