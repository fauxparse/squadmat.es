class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :members
  has_many :squads, through: :members

  protected

  def after_confirmation
    Member.where(user_id: nil, email: email).update_all(user_id: id)
  end
end
