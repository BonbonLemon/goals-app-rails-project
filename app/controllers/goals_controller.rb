class GoalsController < ApplicationController
  def show
    @goal = current_goal
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)

    if @goal.save
      redirect_to user_path(@goal.user_id)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
    @goal = current_goal
  end

  def update
    @goal = current_goal

    if @goal.update(goal_params)
      redirect_to user_path(@goal.user_id)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def destroy
    @goal = current_goal
    user_id = @goal.user_id
    @goal.destroy

    redirect_to user_path(user_id)
  end

  private
  def goal_params
    goal_params = params.require(:goal).permit(:body, :public)
    goal_params[:user_id] = current_user.id
    goal_params
  end

  def current_goal
    Goal.find(params[:id])
  end
end
