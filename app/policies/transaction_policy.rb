class TransactionPolicy < ApplicationPolicy
    def index?
        if user.admin?
            user.admin? || user.user?
        else
            user.user?
        end
    end

    def new?
        user.user?
    end

    def show?
        user.id == record.useralias.id || user.admin? || user.user?
    end

    def export_pdf?
        user.id == record.useralias.id || user.admin?  || user.user?
    end

    def destroy?
        user.id == record.useralias.id || user.admin?  || user.user?
    end

    def edit?
        user.id == record.useralias.id || user.admin?  || user.user?
    end

end