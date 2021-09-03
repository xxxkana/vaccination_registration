class RegistersController < ApplicationController

  def new
    @user = User.find_by(id: params[:id])
    @register = Register.new
  end  

  def create
    @user = User.find_by(register_params)
    @register = Register.new(register_params.merge(user_id: @user.id))
    @register.save
  end

  def register_params
    params.require(:register).permit(:public_uid)
  end

end
