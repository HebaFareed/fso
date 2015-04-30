class EmployerController < ApplicationController
    before_action(:except => [:index, :new, :create, :internship]) { |c| c.prepare_applicant(params[:id]) }

    def index
      @employers = Employer.all
    end

    def show
      @jobs = @employer.job
    end

    def job
        
        job = @employer.job
        if job
            @job = job.all
        end
        
    end
    
    def internship
        job = @employer.job
        if job
            @job = job.all
        end
        
   end
    
   def prepare_applicant(args)
      @employer = Employer.find(args)
      unless @employer
        redirect_to root_path, alert: "Something went wrong!"
      end
  end
end
