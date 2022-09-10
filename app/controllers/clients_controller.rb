class ClientsController < ApplicationController
    def index 
        render json: Client.all, adapter: nil
    end

    def show 
        render json: find_client
    end

    def update 
        find_client.update!(client_params)
        render json: find_client, status: :accepted
    end

    private 

    def find_client
        Client.find(params[:id])
    end

    def client_params 
        params.permit(:name, :age)
    end
end
