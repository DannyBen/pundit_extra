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

  def create?
    true
  end

  # Serve as an always true rule
  def update?
    true
  end

  # Serve as an always false rule
  def destroy?
    false
  end

  # Serve as an always false rule
  def delegate?
    false
  end

  # For view can? testing
  def karate?
    user.admin?
  end
end
