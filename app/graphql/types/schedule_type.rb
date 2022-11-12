class Types::ScheduleType < Types::BaseObject
  description "Schedule"
  field :id, ID, null: false
  field :assignee_id, ID, null: false
  field :assigned_id, ID, null: false
  field :date, String, null: false
  field :watered, Boolean, null: false
end
