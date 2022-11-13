class Types::UserType < Types::BaseObject
  description "Me"
  field :id, ID, null: false
  field :email, String, null: true
  field :full_name, String, null: true
  field :nick_name, String, null: true
  field :is_superadmin, Boolean, null: true
  field :active, Boolean, null: true
end
