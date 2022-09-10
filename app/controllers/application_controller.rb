class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response 
rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_response 

    private

    def record_not_found_response invalid
        render json:"#{invalid.model} not found!", status: :not_found
    end

    def record_invalid_response invalid
        render json:invalid.record.errors.full_messages, status: :unprocessable_entity
    end
end
