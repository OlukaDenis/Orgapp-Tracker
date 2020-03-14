class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  before_action :signed_in_user

  # GET /projects
  # GET /projects.json
  def index
    # @projects = Project.all
    @projects = current_user.author_projects.most_recent.includes(:groups)
    @hour_sum = 0
    @projects.each do |project|
      @hour_sum += project.duration
    end
  end

  # GET /projects/1
  # GET /projects/1.json
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
  # POST /projects.json
  def create
    @project = current_user.author_projects.build(project_params)
    @group = Group.find_by(id: params[:project][:groups])

    respond_to do |format|
      if !@group.nil?
        @grouping = @project.groupings.build(group: @group)
        @project.save
        @grouping.save
        format.html { redirect_to projects_path }
        format.json { render :show, status: :created, location: @project }
        flash[:success] = 'Project was successfully created.'
      elsif @project.valid?
        @project.save
        format.html { redirect_to external_path }
        format.json { render :show, status: :created, location: @project }
        flash[:success] = 'Project was successfully created.'
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @group = Group.find_by(id: params[:project][:groups])

    respond_to do |format|
      if !@group.nil?
        @project.groupings.update(group: @group)
        @project.update(project_params)
        format.html { redirect_to @project }
        format.json { render :show, status: :ok, location: @project }
        flash[:success] = 'Project was successfully updated.'
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
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

  def group_params
    params.require(:grouping).permit(:group)
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:name, :duration)
  end
end
