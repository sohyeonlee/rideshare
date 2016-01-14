class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :rides
  acts_as_messageable


  def mailboxer_email(object)
    if object.class==Mailboxer::Notification
      return nil
    else
      email
    end
  end
  # protected
  # def confirmation_required?
  # end
end
