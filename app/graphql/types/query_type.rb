module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField


    field :login, String, null: true, description: "Login a user" do
      argument :email, String, required: true
      argument :password, String, required: true
    end

    def login(email:, password:) 
      if user = User.where(email: email).first&.authenticate(password)
        user.sessions.create.key
      end
    end

    field :me, Types::UserType, null: false, description: "Me"
    def me
      context[:current_user]
    end

    field :next_schedule, Types::ScheduleType, null: true, description: "Next user for watering"
    def next_schedule
      schedule = Schedule.where(watered: false).order(date: :asc).first()
      if schedule
        user_schedule = User.find_by(id: schedule.assigned_id)
        schedule
      end
    end

  end
end 
