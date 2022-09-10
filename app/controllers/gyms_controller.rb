class GymsController < ApplicationController
    def index 
        render json: Gym.all
    end

    def show 
        render json: find_gym
    end

    def update 
        find_gym.update!(gym_params)
        render json: find_gym, status: :accepted
    end

    def destroy 
        find_gym.destroy 
        head :no_content
    end

    private 

    def find_gym
        Gym.find(params[:id])
    end

    def gym_params 
        params.permit(:name, :address)
    end
end
