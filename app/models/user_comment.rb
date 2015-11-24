class UserComment < ActiveRecord::Base
  validates :body, :author_id, :user_id, presence: true

  belongs_to :user

  belongs_to :author,
    class_name: "User"

  def author_name
    author.username
  end
end
