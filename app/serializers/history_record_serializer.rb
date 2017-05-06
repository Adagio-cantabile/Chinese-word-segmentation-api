class HistoryRecordSerializer < ActiveModel::Serializer
  attributes :id, :before_change, :after_change, :data, :user_id
end
