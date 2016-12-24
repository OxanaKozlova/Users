class User < ActiveRecord::Base
  ROLES = %i[admin moderator user]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :age, numericality: {greater_than: 0}
  validates :email, email_format: { :message => 'is not looking good' }
  validates :name, :last_name,  length: { in: 0..255, allow_blank: false }
  before_save :set_role_default

  def role?(user_role)
    role == user_role
  end

  private
  def set_role_default
    self.role ||= "user"
  end


end
