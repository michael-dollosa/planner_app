class Task < ApplicationRecord
  belongs_to :category
  validates :title, presence: true
  validates :body, presence: true
  validates :status, presence: true
  validates :due_date, presence: true
end
