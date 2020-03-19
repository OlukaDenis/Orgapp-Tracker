class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  before_action :signed_in_user

  # GET /projects
  def index
    @projects = current_user.author_projects.most_recent.includes(:groups)
    @hour_sum = 0
    @projects.each do |project|
      @hour_sum += project.duration
    end
  end

  # GET /projects/1
  def show
    @project = Project.find(params[:id])
  end

  # GET /projects/new
  def new
    @project = current_user.author_projects.build
  end

  # GET /projects/1/edit
  def edit
    @groups = @project.groups
  end

  # POST /projects
  def create
    @project = current_user.author_projects.build(project_params)
    groups = Group.find_by(id: params[:project][:group_ids])
    @project.groups << groups if groups
    if @project.save
      flash[:success] = 'Project was successfully created.'
      if groups
        redirect_to projects_path
      else
        redirect_to external_projects_path
      end
    else
      render 'new'
    end
  end

  # PATCH/PUT /projects/1
  def update
    groups = Group.find_by(id: params[:project][:group_ids])
    @project.groups << groups if groups

    if @project.update(project_params)
      flash[:success] = 'Project was successfully updated.'
      redirect_to @project
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      flash[:success] = 'Project was successfully destroyed.'
    end
  end

  def external
    @external_projects = current_user.author_projects.most_recent.includes(:groups)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:name, :duration, group_ids: [])
  end
end
