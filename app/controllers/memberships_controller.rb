class MembershipsController < ApplicationController
    def create 
        render json: Membership.create!(membership_params), status: :created
    end

    private

    def membership_params 
        params.permit(:charge, :client_id, :gym_id)
    end
end
