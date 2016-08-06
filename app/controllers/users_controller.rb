class UsersController < ApplicationController

  def upgrade
    @user = current_user
  end
end
