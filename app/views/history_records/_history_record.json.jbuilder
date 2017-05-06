json.extract! history_record, :id, :before_change, :after_change, :data, :user_id, :created_at, :updated_at
json.url history_record_url(history_record, format: :json)
