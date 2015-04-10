class CommentsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
    @task = Task.find(params[:task_id])
    @project = Project.find(params[:project_id])
    @comment = Comment.new(comment_params)
    @comment.task_id = @task.id
    @comment.user_id = current_user.id
      if @comment.save
        redirect_to project_task_path(@project, @task)
      else
        redirect_to :back
      end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :task_id, :user_id)
  end

end
