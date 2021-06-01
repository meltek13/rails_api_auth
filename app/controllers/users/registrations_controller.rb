class Users::RegistrationsController < Devise::RegistrationsController
    respond_to :json
    
    private
  
    def respond_with(resource, _opts = {})
      register_success && return if resource.persisted?
  
      register_failed
    end
  
    def register_success   
        token = encode_token({user_id: resource.id})
        render json: {user: resource, token: token}  
    end
  
    def register_failed
      render json: { message: "Something went wrong." }
    end

    
   
  end