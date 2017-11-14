require 'users_helper'

class User < ActiveRecord::Base
  belongs_to :referrer, class_name: 'User', foreign_key: 'referrer_id'
  has_many :referrals, class_name: 'User', foreign_key: 'referrer_id'

  validates :email, presence: true, uniqueness: true, format: {
    with: /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i,
    message: 'Invalid email format.'
  }
  validates :referral_code, uniqueness: true

  before_create :create_referral_code
  after_create :send_welcome_email

  REFERRAL_STEPS = [
    {
      'count' => 1,
      'html' => '$50 Earned',
      'class' => 'two'
    },
    {
      'count' => 2,
      'html' => '$150 Earned',
      'class' => 'three'
    },
    {
      'count' => 3,
      'html' => '$300 Earned',
      'class' => 'four'
    },
    {
      'count' => 4,
      'html' => '$$????',
      'class' => 'five'
    }
  ]

  private

  def create_referral_code
    self.referral_code = UsersHelper.unused_referral_code
  end

  def send_welcome_email
    UserMailer.delay.signup_email(self)
  end
end
