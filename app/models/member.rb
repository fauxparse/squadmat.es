class Member < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  belongs_to :squad
  belongs_to :user, optional: true

  before_validation :sanitize_email_address, if: :email?

  validates :name, :email, :squad, presence: true
  validates :email,
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { scope: :squad_id }

  scope :managers, -> { where(manager: true) }

  def to_s
    name
  end

  private

  def sanitize_email_address
    self.email = email.strip.downcase
  end
end
