class TasksController < ApplicationController
  load_resource
  authorize_resource except: [:complete, :purge, :whoami]
  skip_authorization only: :purge

  def index
  end

  def show
  end

  def new
    render plain: "new task is ready with class #{@task.class}"
  end

  def create
    render plain: "will create task with subject #{@task.subject}"
  end

  def whoami
    skip_authorization
    if can? :karate, Task
      msg = "you are a ninja"
    else
      msg = "you are a user"
    end
    render plain: msg
  end

  protected

  def task_params
    { subject: params[:subject], done: params[:done] }
  end


end
