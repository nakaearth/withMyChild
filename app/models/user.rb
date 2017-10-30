# frozen_string_literal: true

class User < ApplicationRecord
  include IdEncryptable
  include Encryptedable

  attr_encrypted :uid

  has_many :photos
  # has_many :videos

  validates :name, presence: true, length: { maximum: 60 }
  validates :uid, presence: true
  validates :email, length: { maximum: 80 }
  validates :provider, presence: true, length: { maximum: 30 }

  class << self
    def create_account(auth)
      case auth[:provider]
      when 'facebook'
        Users::FacebookRegistration.new.call(auth)
      when 'twitter'
        Users::TwitterRegistration.new.call(auth)
      else
        Users::TwitterRegistration.new.call(auth)
      end
    end
  end
end
