class User < ApplicationRecord
  mount_uploader :passport, DocumentUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :trips, through: :registrations
  has_many :registrations

  validates :name, presence: true
end
