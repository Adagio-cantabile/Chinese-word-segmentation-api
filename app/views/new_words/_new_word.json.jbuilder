json.extract! new_word, :id, :word, :type, :valid, :user_id, :created_at, :updated_at
json.url new_word_url(new_word, format: :json)
