class RegistersController < ApplicationController

  def new
    @user = User.find_by(id: params[:id])
    @register = Register.new
  end  

  def create
    @register = Register.new(register_params)
    @register.save
    #redirect_to root_path
    #bypass_sign_in(current_user) 
  end

  def register_params
    params.require(:register).permit(:user_id)
  end

end
