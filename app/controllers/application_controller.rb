class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :filterReq, :printData, :goHome
  respond_to :html, :js
  
  protected
  puts if :devise_controller?

  def configure_permitted_parameters

  	attributes = [:id, :fname, :lname, :salary, :age, :cohort_id, :admin, :password, :password_confirmation]

    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  def filterReq(req)
      print "YURDDDDD"
  		reqKeys = req.attributes.keys
         reqKeys.delete("encrypted_password")
         reqKeys.delete("reset_password_token")
         reqKeys.delete("reset_password_sent_at")
         reqKeys.delete("remember_created_at")
         reqKeys.delete("updated_at")
         reqKeys.delete("created_at")

        return reqKeys
  end

  def printData(obj, keys) 
  	data = []

  	for key in keys
  		data.push(obj[key])
  	end

  	return data
  end

  def goHome
    puts session
    reset_session
    redirect_to "/"
  end

end




