class ProjectsController < ApplicationController
  layout 'internal'
  before_action :authenticate
  before_action :projmember, only: [:edit, :update, :destroy, :show]
  before_action :projowner, only: [:edit, :update, :destroy]

  def projmember
    @project = Project.find(params[:id])
    unless @project.users.include?(current_user)
      redirect_to projects_path(@project), notice: "You do not have access to that project"
    end
  end

  def projowner
    @project = Project.find(params[:id])
    unless Membership.find_by(project_id: @project, user_id: current_user, role: 1)
      redirect_to project_path(@project), notice: "You do not have access"
    end
  end

  def index
      @projects = current_user.projects
    end

    def show
      @project = Project.find(params[:id])
    end

    def edit
      @project = Project.find(params[:id])
    end

    def update
      @project = Project.find(params[:id])
      if @project.update(project_params)
        redirect_to @project, notice: 'Project was successfully updated.'
      else
        render:edit
      end
    end

    def new
      @project = Project.new
    end

    def create
      @project = Project.new(project_params)
      if @project.save
        Membership.create(user_id: current_user.id, project_id: @project.id, role: 1)
        redirect_to project_tasks_path(@project), notice: 'Project was successfully created.'
      else
        render:new
      end
    end

    def destroy
      @project = Project.find(params[:id])
      @project.destroy
      redirect_to projects_path
    end

    private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
    params.require(:project).permit(:name)
    end



end
