class MembershipsController < ApplicationController
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
     if @membership.update(membership_params)
       redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was successfully updated"
     else
       render :index
     end
   end


  private

  def membership_params
    params.require(:membership).permit(:project_id, :user_id, :role)
  end

end
