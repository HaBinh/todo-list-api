class User < ActiveRecord::Base
  has_many :lists, dependent: :destroy
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  before_save -> { skip_confirmation! }
end
