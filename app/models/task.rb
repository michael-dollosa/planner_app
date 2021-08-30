class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user
  before_save { self.status = status.downcase }
  validates :title, presence: true
  validates :body, presence: true
  validates :status, presence: true
  validates :due_date, presence: true
end
