class ResourcePolicy < ApplicationPolicy

  def index?
    user.has_role? :admin
  end

  def show?
    true
  end

end