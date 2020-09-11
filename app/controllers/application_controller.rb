class ApplicationController < ActionController::API
  before_action :authorized


  private

      # https://medium.com/better-programming/build-a-rails-api-with-jwt-61fb8a52d833
      
      # the token to be given to a user upon successful signup/login
      def encode_token(payload)
        #! For deployment on Heroku use ENV['SECRET_KEY_BASE']
        JWT.encode(payload, Rails.application.credentials.secret_key_base)
      end

      # Since token is sent back in a header this is how we access the token
      def auth_header
        # { Authorization: 'Bearer <token>' }
        request.headers['Authorization']
      end

      def decoded_token
        # if we can access the token
        if auth_header
          token = auth_header.split(' ')[1]
          # header: { 'Authorization': 'Bearer <token>' }
          # The Begin/Rescue syntax allows us to rescue out of an exception in Ruby.
          begin
            # This will decode the payload we originally gave the token
            JWT.decode(token, Rails.application.credentials.secret_key_base, true, algorithm: 'HS256')
          rescue JWT::DecodeError
            nil
          end
        end
      end


      def current_user
        # If we were able to decode the token
        if decoded_token
          # Return the user who we gave the token to
          user_id = decoded_token[0]['user_id']
          user = User.find_by(id: user_id)
        end
      end
        
      def logged_in?
        !!current_user
      end

      def authorized
        render json: { errors: 'Please log in' }, status: :unauthorized unless logged_in?
      end
end
