class Snippet < ActiveRecord::Base
  validates :uuid, uniqueness: true
  validates :uuid, :user_id, :text, :created, presence: true
end
