class WelcomeController < ApplicationController
  def index
    @projects=current_user.projects.where('active=?',true)
  end
  def thankyou

  end
end
