class Api::V1::UsersController < ApplicationController
    before_action :authorized, only: [:auto_login]

    # REGISTER
    def create
      user = User.create(user_params)
      if user.valid?
        token = encode_token({user_id: user.id})
        
        render json: {user: UserSerializer.new(user).to_serialized_json, token: token}
      else
        render json: {error: "Invalid username or password"}
      end
    end
  
    # LOGGING IN
    def login
      user = User.find_by(email: params[:email])
  
      if user && user.authenticate(params[:password])
        token = encode_token({user_id: user.id})
        render json: {user: UserSerializer.new(user).to_serialized_json, token: token}
      else
        render json: {error: "Invalid email or password"}
      end
    end

    private

    def user_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end

end
