class Types::ScheduleType < Types::BaseObject
  description "Schedule"
  field :id, ID, null: false
  field :user_id, ID, null: false
  field :date, Date, null: false
  field :watered, Boolean, null: false
end
