class QuestionPolicy < ApplicationPolicy

    def index?
        user.admin?
    end

    def show?
        user.admin?
    end

    def edit?
        user.admin?
    end

    def create?
        user.admin?
    end

    def destroy?
        user.admin?
    end

end