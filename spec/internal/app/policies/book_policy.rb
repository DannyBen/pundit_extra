class BookPolicy < ApplicationPolicy
  def permitted_attributes_for_create
    user.admin? ? %i[title author price] : [:author]
  end

  def permitted_attributes
    [:price]
  end

  def create?
    true
  end

  def update?
    true
  end
end
