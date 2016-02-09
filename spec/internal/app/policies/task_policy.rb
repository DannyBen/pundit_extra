class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.admin? ? Task.all : [Task.all.first]
    end
  end

  def index?
    true
  end

  def show?
    user.admin? ? true : record.id == 0
  end

  def karate?
    user.admin?
  end

end


