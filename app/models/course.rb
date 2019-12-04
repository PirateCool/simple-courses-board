class Course < ApplicationRecord
  # belongs_to :school
  belongs_to :user
  validates :title, :url, presence: true
end
