class Squad < ApplicationRecord
  has_many :members
  has_many :managers, -> { where(manager: true) }, class_name: 'Member'

  acts_as_url :name,
    url_attribute: :slug,
    limit: 32

  validates :name, :slug, presence: true
  validates :slug,
    uniqueness: true,
    format: { with: /\A[a-z0-9](?:[a-z0-9\-]*[a-z0-9])?\z/ }

  scope :with_members, -> { includes(:members) }

  def to_s
    name
  end

  def to_param
    slug
  end
end
