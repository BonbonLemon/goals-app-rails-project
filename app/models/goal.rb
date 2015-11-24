class Goal < ActiveRecord::Base
  validates :user_id, :body, presence: true

  belongs_to :user

  has_many :comments,
    class_name: "GoalComment"
end
