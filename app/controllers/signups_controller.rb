class SignupsController < ApplicationController
    def create 
        signup = Signup.create(signup_params)
        if signup.valid?
            render json: signup.activity, status: :created
        else 
            render json: { errors: ["Validation errors"] }, status: :unprocessable_entity
        end 
    end 

    def signup_params
        params.permit(:time, :activity_id, :camper_id)
    end 
end
