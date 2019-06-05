module Users
  class EncodeUser
    def initialize(email:, password:)
      @email = email
      @password = password
    end

    def perform
      encode

      {
        token: @token,
        user: @user
      }
    end

    private

    def encode
      @user = User.find_by(email: @email)
      if @user&.authenticate(@password)
        @token = generate_token
      else
        raise StandardError.new("Invalid email and/or password")
      end
    end

    def generate_token
      JWT.encode({ user_id: @user.id }, ENV["JWT_SECRET_KEY"], "HS256")
    end
  end
end
