class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :authentication_keys => [:login]

  has_many :collaborators
  has_many :collaborations, through: :collaborators, source: :wiki
  has_many :wikis

  attr_accessor :login

  # Override Devise Lookup on login
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
  end

  after_initialize :set_role

  def admin?
    role == 'admin'
  end

  def premium?
    role == 'premium'
  end

  def public?
    role == 'public'
  end

  def set_role
    self.role ||= 'public'
  end
end
