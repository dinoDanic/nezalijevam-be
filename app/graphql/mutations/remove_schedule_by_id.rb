module Mutations
  class RemoveScheduleById < BaseMutation

    argument :schedule_id, ID, required: true 

    type Boolean 

    def resolve(schedule_id: nil)
      current_user = context[:current_user]
      
      schedule = Schedule.delete_by(id: schedule_id)
      if schedule 
        true
      else 
        raise GraphQL::ExecutionError, "something went wrong"
      end
    end
  end
end
