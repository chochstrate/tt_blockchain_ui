class LoginController < ApplicationController
  def login
    
    @user_data = User.new 
    @user_data.name = params[:Username]
    @user_data.password = params[:Password]
    @user_data.port = params[:portnumber]
    render
  end
end