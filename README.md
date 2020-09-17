# Recipe-Tracker-Backend Overview

Recipe-Tracker is a virtual recipe box. Users can perform all CRUD actions on recipes they submit, as well as view the recipes submitted by other users! Comes with image upload supported by [Cloudinary](https://cloudinary.com/documentation/rails_integration).

This is the Rails API backend, the code for the frontend can be found here:
[Frontend](https://github.com/ReginaF2012/recipe-tracker-frontend)

## Installation
Fork and clone this repo. 

# database.yml
After you will need to configure database.yml using database.yml.example as a guide. If you need additional instruction this [github gist](https://gist.github.com/jwo/4512764) provides good instruction on how to configure database.yml for postgres, you can also refer to the [postgres documentation](https://www.postgresql.org/docs/).

# JWT
The backend uses JWT for user authentication. In `/app/controllers/application_controller.rb` The JWT are being encoded with an evronment variable you will have to set. You can replace `ENV['SECRET_KEY_BASE']` with `Rails.application.secrets.secret_key_base` or set your own environment variables. Using `Rails.application.secrets.secret_key_base`:
```
    #application_controller.rb
    ...
      def encode_token(payload)
        #! Environment variables will need to be set!
        JWT.encode(payload, Rails.application.secrets.secret_key_base)
      end
      
      ...
    def decoded_token
        # if we can access the token
        if auth_header
          token = auth_header.split(' ')[1]
          # header: { 'Authorization': 'Bearer <token>' }
          # The Begin/Rescue syntax allows us to rescue out of an exception in Ruby.
          begin
            # This will decode the payload we originally gave the token
            JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
          rescue JWT::DecodeError
            nil
          end
        end
    end
```

# Cloudinary
You will need to sign up for [Cloudinary](https://cloudinary.com/) to get your own credentials. After that configure `/config/initializers/cloudinary.rb`. Remember to store these in secret environment variables or add the file to your `.gitignore` before pushing anything to version control!

# Starting the Server
Once everything is configured to your specifications it is recommended you run your server on a port other than localhost:3000 as more than likely the React frontend will be running on that server. So for instance you could run
```
$ rails s -p 3001
```
to run your server on localhost:3001 instead.

## Usage

This api is intended to be used with [Recipe-Tracker-Frontend](https://github.com/ReginaF2012/recipe-tracker-frontend). Once you fork and clone that repo and it is making fetch requests to this server:

- Users can sign up and login
- Users can perform all CRUD actions on their own recipes
- Users can view recipes created by other users
- Provides search feature


## License

[MIT License](https://opensource.org/licenses/MIT).