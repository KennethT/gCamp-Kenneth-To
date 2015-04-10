class AboutController < ApplicationController
  def index
    # @project = Project.find(params[:project_id])
    # @task = Task.find(params[:task_id])
    @projects = Project.all
    @tasks = Task.all
    @memberships = Membership.all
    @users = User.all
    @comments = Comment.all
  end
end
