class TasksController < ApplicationController
  def show
    task_id = params[:id]
    @task = Task.find(task_id)
    @comments = @task.comments
  end

  def new
    @task = Task.new
    @project = Project.find(params[:project_id])
  end

  def create
    task = task_params
    name = task[:name]
    description = task[:description]
    priority = task[:priority]
    deadline = task[:deadline]
    status = task[:status]
    project_id = params[:project_id]
    @task = Task.create(name: name, description: description, priority: priority, deadline: deadline, status: status, project_id: project_id)
    redirect_to "/projects/#{project_id}"
  end

  def destroy
    #@task.destroy
    Task.find(params[:task_id]).destroy
    respond_to do |format|
      format.html { redirect_to project_url(id: params[:project_id]), notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def task_params
    params.require(:task).permit(:name, :description, :priority, :deadline, :status, :project_id)
  end
end
