class SettingsController < ApplicationController
  before_action :set_user, only: %i[ create ]
  def index
    user = current_user
  end

  def create
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to settings_path, notice: "User Setting was successfully updated." }
        format.json { render :show, status: :ok}
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find(user_params[:id])
  end

  def user_params
    params.require(:current_user).permit(:id, :email, :image, :fname, :lname, :location, :dob, :contact_no)
  end
end