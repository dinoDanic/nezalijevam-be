module Mutations
  class CreateUser < BaseMutation
    # arguments passed to the `resolve` method
    argument :email, String, required: true
    argument :full_name, String, required: true
    argument :nick_name, String, required: true
    argument :password, String, required: true

    # return type from the mutation
    type Types::UserType

    def resolve(email: nil, password: nil, full_name: nil, nick_name: nil)
      if User.exists?(email: email) 
        raise GraphQL::ExecutionError, "#{email} exists"
      else
      User.create!(
        email: email,
        password: password,
        full_name: full_name,
        nick_name: nick_name,
        is_superadmin: false
      )
      end
    end
  end
end
