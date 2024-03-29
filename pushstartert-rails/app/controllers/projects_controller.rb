class ProjectsController < ApplicationController
  load_and_authorize_resource

  # before_action :set_project, only: [:show, :edit, :update, :destroy]
  # before_action :correct_user, ony: :destroy

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  def news
    @projects = Project.find(:all, order: 'created_at desc')
    render template: '/projects/feed.rss.builder', layout: false
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.build(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def backup
    set_project
    @project.funded += params[:value].to_f
    @project.save
    redirect_to @project, notice: 'Project was successfully backed.'
  end

  def funded
    @projects = Project.where('funding_goal <= funded')
  end

  def unfreeze
    set_project
    @project.unfreeze
    @project.save
    respond_to do |format|
      format.json { render action: 'funded' }
    end
    # redirect_to :back
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  protected

    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :funding_goal, :funded, :state)
    end

end
