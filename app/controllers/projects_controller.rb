class ProjectsController < ApplicationController
  def index
    user_id = session[:user_id]
    @projects = Project.where(user_id: user_id)
  end

  def new
    @project = Project.new
  end

  def show
    project_id = params[:id]
    @project = Project.find(project_id)
    @tasks = @project.tasks
  end

  def create
    project = project_params
    name = project[:name]
    description = project[:description]
    user_id = session[:user_id]
    @project = Project.create(name: name, description: description, user_id: user_id)
    redirect_to '/projects'
  end

  def destroy
    Project.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :description)
  end
end
