class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    # @tasks = Task.all
    # @tasks = current_user.tasks #@tasks = Task.where(user_id: current_user.id)と同じ結果
    @tasks = current_user.tasks.order(created_at: :desc) 
  end

  def show
    # @task = Task.find(params[:id])
    # @task = current_user.tasks.find(params[:id])
  end

  def new
    @task = Task.new

  end

  def edit
    # @task = Task.find(params[:id])
    # @task = current_user.tasks.find(params[:id])
  end

  def update
    # task = Task.find(params[:id])
    # task = current_user.tasks.find(params[:id])
    # task.update!(task_params)
    @task.update!(task_params)
    task_logger.debug #taskのログを出力
    # redirect_to tasks_url, notice: "タスク「#{task.name}」を更新しました。"
    redirect_to tasks_url, notice: "タスク「#{@task.name}」を更新しました。"
  end

  def create
    # @task = Task.new(task_params)
    # @task = Task.new(task_params.merge(user_id: current_user.id)) ユーザーidを代入するやり方①
    @task = current_user.tasks.new(task_params) #ユーザーidを代入するやり方②


    if @task.save
      logger.debug "task: #{@task.attributes.inspect}"
      task_logger.debug #taskのログを出力
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    else
      render :new
    end
    # task = Task.new(task_params)
    # task.save!
    # redirect_to tasks_url, notice: "タスク「#{task.name}」を登録しました。"
  end

  def destroy
    # task = Task.find(params[:id])
    # task = current_user.tasks.find(params[:id])
    # task.destroy
    @task.destroy
    # redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました。"
    redirect_to tasks_url, notice: "タスク「#{@task.name}」を削除しました。"
  end




  def task_logger
    @task_logger ||= Logger.new('log/task.log','daily')
  end

  

  private
  
  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  

  def task_params
    params.require(:task).permit(:name, :description)
  end

end
