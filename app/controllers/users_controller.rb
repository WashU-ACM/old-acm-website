class UsersController < ApplicationController
  before_action :require_login
  before_action :set_user, except: [:index]
  before_action :require_admin, only: [:index, :toggle_admin]
  before_action :require_permission, only: [:edit, :update, :destroy]
  
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/1/edit
  def edit 
    @user = current_user
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1/toggle_admin
  def toggle_admin
    @user.is_admin = !@user.is_admin?
    @user.save!
    redirect_to @user
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    session[:user_id] = nil
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :personal_bio
      )
    end

    # Don't let users mess with each other's settings.
    def require_permission
      return permission_redirect unless @user == current_user or current_user.is_admin?
    end
end
