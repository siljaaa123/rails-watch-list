class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  #  belongs to helps us to use bookmark.list and bookmark.movie

  validates :comment, presence: true
  validates :comment, length: {minimum: 6}
  validates :movie_id, presence: true, :uniqueness => {:scope => :list_id}
end
