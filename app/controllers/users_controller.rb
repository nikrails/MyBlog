class UsersController < ApplicationController
protect_from_forgery with: :null_session
 load_and_authorize_resource


 def show
  @user = User.find(params[:id])

 end

 def new 
 end

 def update
   current_user =  current_user.find(params[:id])
 
    if  current_user.update( current_user_params)
      redirect_to  current_user
     else
      render 'edit'
    end
 end

 def current_user_params
   params.require(:user).permit(:first_name,:name, :last_name,:contact_no,:email,:role)
 end
end
