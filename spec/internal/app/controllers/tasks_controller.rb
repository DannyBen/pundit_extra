class TasksController < ApplicationController
  load_resource
  authorize_resource except: [:complete, :purge, :whoami]
  skip_authorization only: :purge

  def index
  end

  def show
  end

  def complete
    render plain: 'complete'
  end

  def purge
    render plain: 'transfer'
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
end
