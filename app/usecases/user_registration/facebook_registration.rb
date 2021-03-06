# frozen_string_literal: true

module UserRegistration
  class FacebookRegistration
    def initialize(params)
      @params = params
    end

    def call
      ActiveRecord::Base.transaction do
        @login_user = User.find_or_create_by(name: @params[:info][:name]) do |user|
          user.name  = @params[:info][:name]
          user.email = @params[:info][:email]
          user.provider = @params[:provider]
          user.uid      = @params[:uid]
          user.nickname = @params[:extra][:raw_info][:username]
          user.image_url = @params[:info][:image] || 'no_photo.jpeg'

          if @params[:credentials].present?
            user.access_token = @params[:credentials][:token]
          end
        end

        @login_user.save!
        @login_user
      end
      # rescue Faraday::TimeoutError => e
      #   puts 'ELへの登録失敗'
      #   puts e.message
    end
  end
end
