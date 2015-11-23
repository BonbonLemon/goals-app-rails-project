module GoalsHelper
  def user_goals(user)
    if user == current_user
      user.goals
    else
      user.goals.select{ |goal| goal.public }
    end
  end

  def goal_status(goal)
    goal.completed ? "Complete" : "In Progress"
  end
end
