class BugPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.role=='Admin'
        scope.all
      elsif(user.role=='QA')

        scope.where.not(status: 'Done' )
      elsif(user.role=='Develpor')
        scope.where.not(status: 'resolved' )
      end
    end
  end

def index?

    return true if user.present?

      end


  def show?

  return true if user.present?
  end
  def create?
    return true if user.present? and (user.role=='Admin'||user.role=='QA')
  end


  def update?
     if user.present? and user.role=='Admin'
        return true
      elsif user.present? and  user.role == 'Develpor' and record.status == 'notsolved'
        return true

      end
  end


  def destroy?
    return true if user.present? and user.role=='Admin'
  end









  def new?
    create?
  end


  def edit?
    update?
  end

end
