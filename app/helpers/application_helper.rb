module ApplicationHelper
  def generate_facebook_share_message(referral_code)
    I18n.t('referral.social_message.facebook', referral_code: referral_code, referral_link: referral_link(referral_code))
  end

  def generate_twitter_share_message(referral_code)
    I18n.t('referral.social_message.twitter', referral_code: referral_code, referral_link: referral_link(referral_code))
  end

  def referral_link(referral_code)
    "#{Rails.application.config.action_mailer.default_url_options}/referral?code=#{CGI::escape(referral_code)}"
  end
end
