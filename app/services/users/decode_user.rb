module Users
  class DecodeUser
    def initialize(token:)
      @token = token
    end

    def perform
      User.find(decode["user_id"])
    rescue
      raise StandardError.new("Invalid token or User not found!")
    end

    private

    def decode
      JWT.decode(@token, ENV["JWT_SECRET_KEY"], true, { algorithm: 'HS256' })[0]
    end
  end
end
