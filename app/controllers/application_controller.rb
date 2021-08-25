class ApplicationController < ActionController::Base

  def authorize_admin
    if signed_in? == false
      flash[:alert] = "Please sign in to continue"
      if request.referrer == nil
        redirect_to root_path
      else
        redirect_to request.referrer
      end
    end
    if signed_in? == true
      if current_user.admin != true
        flash[:alert] = "You are not authorized to perform this action"
        if request.referrer == nil
          redirect_to root_path
        else
          redirect_to request.referrer
        end
      end
    end
  end

  def logged_in?
    current_user != nil
  end
end
