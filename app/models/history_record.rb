class HistoryRecord < ApplicationRecord
  belongs_to :user
  serialize :before_change, Hash
  serialize :after_change, Hash
end
