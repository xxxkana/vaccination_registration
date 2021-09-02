class RegistersController < ApplicationController

  def new
    @user = User.find_by(id: params[:id])
    @register = Register.new
  end  

  def create
    @user = User.find_by(id: params[:id])
    @register = Register.new(register_params)
    @register.save
    #redirect_to root_path
    #bypass_sign_in(current_user) 
  end

  private

  def register_params
    params.require(:register).permit(:user_id, :public_uid)
  end

end
