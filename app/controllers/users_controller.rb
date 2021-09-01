class UsersController < ApplicationController

  def edit

  end

  def update
    if current_user.update(user_params)
       redirect_to root_path
       bypass_sign_in(current_user) 
    else
       render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password__confirmation, :name_reading, :email, :address, :phone_number, :datetime, :blood_type_id, :body_weight, :height, :body_temperature, :allergy_id, :chronic_condition_id, :venue_id)
  end

end
