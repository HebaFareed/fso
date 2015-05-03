class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:course_id])
  end

  def destroy
    @course = Course.find(params[:course_id])
    @course.destroy
    respond_with(@job)
  end

  def create_follower
    @course = Course.find(params[:course_id])
    @applicant = current_applicant
    current_applicant.follow(@course)
    redirect_to courses_path
  end

  def destroy_follower
    @course = Course.find(params[:course_id])
    @applicant = current_applicant
    current_applicant.stop_following(@course)
  end
end
