class NewWordSerializer < ActiveModel::Serializer
  attributes :id, :word, :type, :valid, :user_id
end
