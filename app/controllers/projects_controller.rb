class ProjectsController < ApplicationController
  before_action :set_project, only: [:interest, :show, :edit, :update, :destroy]

  
  #constants for the "Enumerated Type" field "state"
  
  
  
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end
  
  def interest
   if !current_user
     redirect_to "/"
   elsif !@project.enthusiast_ids.include?(current_user.id)
      @project.enthusiast_ids = current_user.id;
      flash[:notice] = "Expessed interest"
      redirect_to @project

    #if user is attempting to "destroy" interest
   else @project.enthusiast_ids.include?(current_user.id)
      @project.enthusiasts.delete(current_user)
      flash[:notice] = "Deleted interest"
      redirect_to @project
    end
  end
  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    if !current_user
      redirect_to "/invalid_request"
    else
    @project = Project.new
    end
  end

  # GET /projects/1/edit
  def edit
    if @project.owner_id != current_user.id
	redirect_to "/invalid_request"
     end
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

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

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit!
    end
end
