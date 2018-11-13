class TransactionPolicy < ApplicationPolicy
    def index?
        user.id == record.useralias.id || user.admin? || user.user?
    end

    def show?
        # puts record.user.id
        user.id == record.useralias.id || user.admin? || user.user?
    end

    def export_pdf?
        user.id == record.useralias.id || user.admin?
    end

    def destroy?
        user.id == record.useralias.id || user.admin?
    end

    def edit?
        user.id == record.useralias.id || user.admin?
    end

end