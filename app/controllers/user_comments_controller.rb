class UserCommentsController < ApplicationController
  def create
    @user_comment = UserComment.new(user_comment_params)
    @user_comment.save!
    flash.now[:errors] = @user_comment.errors.full_messages
    redirect_to user_path(@user_comment.user_id)
  end

  def destroy
    @user_comment = UserComment.find(params[:id])
    user_id = @user_comment.user_id
    @user_comment.destroy

    redirect_to user_path(user_id)
  end

  private
  def user_comment_params
    uc_params = params.require(:user_comment).permit(:body, :user_id)
    uc_params[:author_id] = current_user.id
    uc_params
  end
end
