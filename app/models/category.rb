class Category < ApplicationRecord
  has_many :tasks
  before_save { self.name = name.downcase }
  validates :name, presence: true, length: { maximum: 20 },
            uniqueness: { case_sensitive: false}

  validates :description, presence: true
end
