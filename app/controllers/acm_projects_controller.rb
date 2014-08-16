class AcmProjectsController < ApplicationController
  before_action :set_acm_project, only: [:show, :edit, :update, :destroy]

  # GET /acm_projects
  # GET /acm_projects.json
  def index
    @acm_projects = AcmProject.where("status = 'approved'")
  end

  # GET /acm_projects/1
  # GET /acm_projects/1.json
  def show
  end

  # GET /acm_projects/new
  def new
    @acm_project = AcmProject.new
  end

 

  # POST /acm_projects
  # POST /acm_projects.json
  def create
    @acm_project = AcmProject.new(acm_project_params)

    respond_to do |format|
      if @acm_project.save
        format.html { redirect_to @acm_project, notice: 'Your entry has been successfully submitted!' }
        format.json { render action: 'show', status: :created, location: @acm_project }
      else
        format.html { render action: 'new' }
        format.json { render json: @acm_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acm_projects/1
  # PATCH/PUT /acm_projects/1.json
  #def update
  #  respond_to do |format|
  #    if @acm_project.update(acm_project_params)
  #      format.html { redirect_to @acm_project, notice: 'Acm project was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: 'edit' }
  #      format.json { render json: @acm_project.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /acm_projects/1
  # DELETE /acm_projects/1.json
  def destroy
	if !current_user or current_user.role != "admin"
		redirect_to "/invalid_request"
	else
		@acm_project.destroy
    		redirect_to "/submissions"
	end
    
  end
  
   def approve
	if !current_user or current_user.role != "admin"
		redirect_to "/invalid_request"
	else
	      @acm_project = AcmProject.find_by_id(params[:id])
	      @acm_project.update_attribute(:status, "approved")
	      redirect_to "/submissions"
	end
   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acm_project
      @acm_project = AcmProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acm_project_params
       params.require(:acm_project).permit!
    end
end
