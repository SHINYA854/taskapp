class TasksController < ApplicationController
 
  def index
    @tasks = current_user.tasks
  end
  
  def show
    @task = Task.find(params[:id])
  end  
  

  def new
    @task = Task.new
  end
 
  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      flash[:success] = "タスク新規作成しました。"
      redirect_to user_tasks_path
    else
      render :new
    end  
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      flash[:success] = "タスクを更新しました。"
      redirect_to user_task_path
    else
      render :edit
    end  
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to user_tasks_path
  end
  
  
  private
  
    def task_params
      params.require(:task).permit(:task_title,:task_content)
    end
end