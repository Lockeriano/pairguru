class Comment < ApplicationRecord
  default_scope { order('created_at DESC') }

  belongs_to :movie
  belongs_to :user

  validates :body, presence: true
  validates :user_id, presence: true
  validates :movie_id, uniqueness: { scope: :user_id, message: "You've already commented on this movie" }

  delegate :name, to: :user
end
