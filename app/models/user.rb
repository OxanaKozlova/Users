class User < ActiveRecord::Base
  validates :age, numericality: {greater_than: 0}
  validates :email, email_format: { :message => 'is not looking good' }
end
