module Api 
  module V1

    class CoursesController < ApplicationController
      before_action :authorize_access_request!
      before_action :set_course, only: [:show, :update, :destroy]

      # GET /courses
      def index
        @courses = current_user.courses.all

        render json: @courses
      end

      # GET /courses/1
      def show
        render json: @course
      end

      # POST /courses
      def create
        @course = current_user.courses.build(course_params)

        if @course.save
          render json: @course, status: :created, location: @course
        else
          render json: @course.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /courses/1
      def update
        if @course.update(course_params)
          render json: @course
        else
          render json: @course.errors, status: :unprocessable_entity
        end
      end

      # DELETE /courses/1
      def destroy
        @course.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_course
          @course = current_user.records.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def course_params
          params.require(:course).permit(:title, :url, :school_id, :user_id)
        end
    end
  end
end
