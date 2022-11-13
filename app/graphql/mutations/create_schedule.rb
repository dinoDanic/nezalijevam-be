module Mutations
  class CreateSchedule < BaseMutation

    argument :date, String, required: true
    argument :assigned, ID, required: false 
    argument :random, Boolean, required: false

    type Types::UserType

    def resolve(date: nil, assigned: nil, random: nil)

      current_user = context[:current_user]

      schedule_date = Schedule.where(date: date, watered: false).first()

      if schedule_date
          raise GraphQL::ExecutionError, "Schedul date allready exists"
      end

      if random 
        random_user = User.order(Arel.sql('Random()')).first
        schedule_random = Schedule.create!(
          assignee_id: current_user.id, 
          assigned_id: random_user.id,
          date: date,
          watered: false,
        )
        if schedule_random
          random_user
        else 
          raise GraphQL::ExecutionError, "something went wrong"
        end
      else
        schedule = Schedule.create!(
          assignee_id: current_user.id, 
          assigned_id: assigned,
          date: date,
          watered: false,
        )
        if schedule 
          User.where(id: assigned).first()
        else 
          raise GraphQL::ExecutionError, "something went wrong"
        end
      end
    end
  end
end
