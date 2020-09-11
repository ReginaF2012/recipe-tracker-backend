class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :login]

  

    # REGISTER
    def create
      user = User.create(user_params)
      if user.valid?
        token = encode_token({user_id: user.id})
        
        render json: {user: UserSerializer.new(user).to_serialized_json, token: token}
      else
        render json: {errors: user.errors.full_messages}, status: :unauthorized
      end
    end
  
    # LOGGING IN
    def login
      user = User.find_by(email: params[:email])
     
      if user && user.authenticate(params[:password])
        token = encode_token({user_id: user.id})
        render json: {user: UserSerializer.new(user).to_serialized_json, token: token}
      else
        render json: {errors: "Invalid email or password"}, status: :unauthorized
      end
    end

    def autologin
      token = encode_token({user_id: current_user.id})
      render json: {user: UserSerializer.new(current_user).to_serialized_json, token: token}
    end

    private

    def user_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end

end
