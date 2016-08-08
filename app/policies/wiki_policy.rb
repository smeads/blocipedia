class WikiPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    if user
      (user.role == 'admin') || record.users.include?(user) || (user == record.user) || (record.private == false)
    else
      record.private == false
    end
  end

class Scope < Scope
    attr_reader :user, :scope

    def initializer(user, scope)
      @user = user
      @scope = scope
    end

  def resolve

   if user == nil
     scope.where(private: false).order('wikis.created_at DESC')
   elsif user.role == "admin"
     scope.all.order('wikis.created_at DESC')
   elsif user.role == "premium"
     scope.where(private: true).order('wikis.created_at DESC')
     scope.all.order('wikis.created_at DESC')
   else
     scope.where(private: false).order('wikis.created_at DESC')
   end
  end
 end
end
