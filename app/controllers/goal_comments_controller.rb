class GoalCommentsController < ApplicationController
  def create
    @goal_comment = GoalComment.new(goal_comment_params)
    @goal_comment.save
    flash[:errors] = @goal_comment.errors.full_messages
    redirect_to goal_path(@goal_comment.goal_id)
  end

  def destroy
    @goal_comment = GoalComment.find(params[:id])
    goal_id = @goal_comment.goal_id
    @goal_comment.destroy

    redirect_to goal_path(goal_id)
  end

  private
  def goal_comment_params
    gc_params = params.require(:goal_comment).permit(:body, :goal_id)
    gc_params[:author_id] = current_user.id
    gc_params
  end
end
