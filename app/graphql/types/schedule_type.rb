class Types::ScheduleType < Types::BaseObject
  description "Schedule"
  field :id, ID, null: false
  field :assignee_id, ID, null: true
  field :assigned_id, ID, null: true
  field :date, String, null: true
  field :watered, Boolean, null: true
end
