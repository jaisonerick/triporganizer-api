class User < ApplicationRecord
  default_scope { order(name: :asc) }

  mount_uploader :passport, PdfDocumentUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :trips, through: :registrations
  has_many :registrations

  validates :name, :email, presence: true

  def generate_auth_token
    token = SecureRandom.hex
    self.update_columns(auth_token: token)
    token
  end

  def invalidate_auth_token
    self.update_columns(auth_token: nil)
  end
end
