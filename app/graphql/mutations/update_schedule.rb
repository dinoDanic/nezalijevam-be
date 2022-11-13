module Mutations
  class UpdateSchedule < BaseMutation

    argument :schedule_id, ID, required: true 
    argument :watered, Boolean, required: false
    argument :date, String, required: false
    argument :assigned_id, ID, required: false

    type Types::ScheduleType

    def resolve(schedule_id: nil, **args)
      current_user = context[:current_user]
      
      schedule = Schedule.find_by(id: schedule_id)

      if schedule.update(args) 
        schedule
      else
        raise GraphQL::ExecutionError, "Could not update schedule"
      end
        
    end
  end
end
