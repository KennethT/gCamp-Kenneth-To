class MembershipsController < ApplicationController
  layout 'internal'
  before_action :projowner, only: [:edit, :update, :destroy]
  
  def projowner
    @project = Project.find(params[:id])
    unless Membership.find_by(project_id: @project, user_id: current_user, role: 1)
      redirect_to project_path(@project), notice: "You do not have access"
    end
  end

  def index
    @project = Project.find(params[:project_id])
    @membership = Membership.new
    @memberships = @project.memberships
  end

  def create
    @project = Project.find(params[:project_id])
    @membership = Membership.new(membership_params)
    @membership.project_id = @project.id
    if @membership.save
      redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was successfully created"
    else
      flash.now[:alert] = @membership.errors.full_messages
      render :index
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @membership = Membership.find(params[:id])
     if @membership.destroy
       redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was successfully removed"
     end
   end

   def update
     @project = Project.find(params[:project_id])
     @membership = Membership.find(params[:id])
     if ((@project.memberships.where(role: 1).count == 1) && (@membership.role == "owner"))
       redirect_to project_memberships_path(@project), notice: "Projects must have at least one owner"
     else
       @membership.update(membership_params)
       redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was successfully updated"
     end
   end


  private

  def membership_params
    params.require(:membership).permit(:project_id, :user_id, :role)
  end

end
