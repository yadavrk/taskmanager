class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @task = Task.find(params[:task_id])
    @project = Project.find(params[:project_id])
  end

  def create
    comment = comment_params
    comment_text = comment[:comment_text]
    task_id = params[:task_id]
    @comment = Comment.create(comment_text: comment_text, task_id: task_id)
    redirect_to "/projects/#{params[:project_id]}/tasks/#{params[:task_id]}"
  end

  def destroy
    Comment.find(params[:comment_id]).destroy
    respond_to do |format|
      format.html { redirect_to "/projects/#{params[:project_id]}/tasks/#{params[:task_id]}", notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_text, :task_id)
  end
end

