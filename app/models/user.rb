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
  REFERRAL_REWARDS = [
    '1 free card',
    '5 free cards',
    '1 year of free cards (12)'
  ]

  REFERRAL_STEPS = [
    {
      'count' => 1,
      'html' => REFERRAL_REWARDS[0],
      'class' => 'one',
      'count_label' => '1'
    },
    {
      'count' => 2,
      'html' => REFERRAL_REWARDS[1],
      'class' => 'two',
      'count_label' => '2'
    },
    {
      'count' => 3,
      'html' => REFERRAL_REWARDS[2],
      'class' => 'three',
      'count_label' => '3'
    }
  ]

  private

  def create_referral_code
    self.referral_code = UsersHelper.unused_referral_code
  end

  def send_welcome_email
    UserMailer.signup_email(self.id).deliver_now
  end
end
