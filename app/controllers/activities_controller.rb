class ActivitiesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with:  :render_not_found

    def index
        render json: Activity.all
    end

    # def show
    #     render json: Activity.find(params[:id])
    # end

    def destroy
        activity = find_activity
        activity.signups.destroy_all
        activity.destroy
        head :no_content
    end

    private

    def find_activity
        Activity.find(params[:id])
    end

    def render_not_found
        render json: { error: "Activity not found" }, status: :not_found
    end
end
