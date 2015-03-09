class MembershipsController < ApplicationController
  before_action :authenticate
    def index
      @memberships = Membership.all
      @project = Project.find(params[:project_id])
      @membership = @project.memberships.build
    end

    def show
      @membership = Membership.find(params[:id])
    end

    def edit
      @membership = Membership.find(params[:id])
    end

    def update
      @membership = Membership.find(params[:id])
      if @membership.update(membership_params)
        redirect_to @membership, notice: 'Membership was successfully updated.'
      else
        render:edit
      end
    end

    def new
      @membership = Membership.new
    end

    def create
      @membership = Membership.new(membership_params)
      @membership.project_id = @project.id
      @project = Project.find(params[:project_id])

      if @membership.save
        redirect_to @membership, notice: 'Membership was successfully created.'
      else
        render:new
      end
    end

    def destroy
      @membership = Membership.find(params[:id])
      @membership.destroy
      redirect_to memberships_path
    end

    private
    def set_membership
      @membership = Membership.find(params[:id])
    end

    def membership_params
    params.require(:membership).permit(:project_id, :user_id, :role)
    end


end
