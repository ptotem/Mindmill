class ProjectsController < ApplicationController

  def launch_page
    @project=Project.find(params[:id])
  end

end
