# frozen_string_literal: true

class RequestPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.has_any_role? :user, :admin
  end

  def show?
    index?
  end

  def create?
    @user.has_any_role? :user, :admin
  end

  def new?
    create?
  end

  def update?
    create?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  def accept?
    create?
  end

  def decline?
    create?
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    private

    attr_reader :user, :scope
  end
end
