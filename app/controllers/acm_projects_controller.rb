class AcmProjectsController < ApplicationController
	before_action :set_acm_project, only: [:show, :edit, :update, :destroy, :approve]
	before_action :require_login, except: [:index, :show]
	before_action :require_admin, except: [:index, :show, :new, :create]

	# GET /showcase
	# GET /showcase.json
	def index
		@acm_projects = AcmProject.where_approved.order(created_at: :desc)
	end

	# GET /showcase/1
	# GET /showcase/1.json
	def show
	end

	# GET /showcase/new
	def new
		@acm_project = AcmProject.new
	end

	# POST /showcase
	# POST /showcase.json
	def create
		@acm_project = AcmProject.new(acm_project_params)
		@acm_project.owner = current_user
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

	def edit
	end

	# PATCH/PUT /showcase/1
	# PATCH/PUT /showcase/1.json
	def update
		respond_to do |format|
			if @acm_project.update(acm_project_params)
				format.html { redirect_to @acm_project, notice: 'Acm project was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @acm_project.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /showcase/1
	# DELETE /showcase/1.json
	def destroy
		@acm_project.destroy
		redirect_to submissions_acm_projects_path
	end

  def submissions
  	@acm_projects = AcmProject.all
  	@approved = AcmProject.where_approved
  	@pending = AcmProject.where_pending
  end

	def approve
		@acm_project.update_attribute(:status, "approved")
		redirect_to submissions_acm_projects_path
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_acm_project
		@acm_project = AcmProject.friendly.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def acm_project_params
		params.require(:acm_project).permit(
			:name,
			:description,
			:image
		)
	end
end
