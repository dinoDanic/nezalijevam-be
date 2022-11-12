module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_schedule, mutation: Mutations::CreateSchedule
    field :remove_schedule_by_id, mutation: Mutations::RemoveScheduleById
  end
end
