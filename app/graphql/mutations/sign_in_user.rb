module Mutations
  class SignInUser < BaseMutation
    null true

    argument :credentials, Types::AuthProviderCredentialsInput, required: false

    field :token, String, null: true
    field :message, String, null: true
    field :user, Types::UserType, null: true

    def resolve(credentials: nil)
      # basic validation
      return unless credentials
      
      # binding.pry
      

      user = User.find_by email: credentials[:email]

      # ensures we have the correct user
      return unless user
       usr = user.authenticate(credentials[:password])
       
       if usr       
         # use Ruby on Rails - ActiveSupport::MessageEncryptor, to build a token
         crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
         token = crypt.encrypt_and_sign("user-id:#{ user.id }")
         context[:session][:token] = token
         { user: user, token: token, message: 'ok' }
       else        
         { message: 'password is invalid' }
       end   
    end
  end
end