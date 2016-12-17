class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :age, numericality: {greater_than: 0}
  validates :email, email_format: { :message => 'is not looking good' }
  validates :name, :last_name,  length: { in: 0..255, allow_blank: false }
end
