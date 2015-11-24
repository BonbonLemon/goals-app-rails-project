class GoalComment < ActiveRecord::Base
  validates :body, :author_id, :goal_id, presence: true

  belongs_to :goal

  belongs_to :author,
    class_name: "User"

  def author_name
    author.username
  end
end
