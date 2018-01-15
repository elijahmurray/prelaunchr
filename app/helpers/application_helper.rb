module ApplicationHelper
  def generate_facebook_share_message(referral_code)
    I18n.t('referral_page.social_message.facebook', referral_code: referral_code, referral_link: referral_link(referral_code))
  end

  def generate_twitter_share_message(referral_code)
    I18n.t('referral_page.social_message.twitter', referral_code: referral_code, referral_link: referral_link(referral_code))
  end

  def referral_link(referral_code)
    "#{papaya_url}/referral?code=#{CGI::escape(referral_code)}"
  end

  def papaya_url
    case Rails.env
    when "test"
      "http://example.com"
    when "development"
      "http://lvh.me:3000"
    when "production"
      "https://my.habit.com"
    else
      fail "missing papaya url for #{Rails.env}"
    end
  end

  def papaya_credentials
    basic_auth = [ENV['PAPAYA_BASIC_USERNAME'], ENV['PAPAYA_BASIC_PASSWORD']].compact.join(':')
    basic_auth.presence + "@" rescue nil
  end
end
