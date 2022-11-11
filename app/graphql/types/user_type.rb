class Types::UserType < Types::BaseObject
  description "Me"
  field :id, ID, null: false
  field :email, String, null: false
  field :full_name, String, null: false
  field :nick_name, String, null: false
  field :is_superadmin, Boolean, null: false
  field :active, Boolean, null: false
end
