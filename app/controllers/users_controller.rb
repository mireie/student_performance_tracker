class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin 

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def toggle_active
    @user = User.find(params[:id])
    if @user.active?
      @user.update(:active => false)
      flash[:notice] = "User was successfully deactivated." 
    else
      @user.update(:active => true)
      flash[:notice] = "User was successfully activated."
    end
    redirect_to "/user-admin"
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to "/user-admin", notice: "User was successfully removed." }
      format.json { head :no_content }
    end
  end

end