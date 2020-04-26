class Task < ApplicationRecord
  belongs_to :user
  
  validates :task_title, presence: true, length: {maximum: 50}
  validates :task_content, presence: true, length: {maximum: 300}
end
