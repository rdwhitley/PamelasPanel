class WelcomeController < ApplicationController
  def index
    @courses = Course.all

  	def filterReq(req)
  		reqKeys = req.attributes.keys
         reqKeys.delete("encrypted_password")
         reqKeys.delete("reset_password_token")
         reqKeys.delete("reset_password_sent_at")
         reqKeys.delete("remember_created_at")
         reqKeys.delete("updated_at")
         reqKeys.delete("created_at")

        return reqKeys
  	end
  end
end
