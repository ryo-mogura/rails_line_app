# frozen_string_literal: true

class User < ApplicationRecord
  has_many :foods, dependent: :destroy
  has_many :line_messages, dependent: :destroy

  enum status: { idle: 0,
                 waiting_for_recipe: 1,
                 waiting_add_food_name: 2,
                 waiting_add_food_quantity: 3,
                 waiting_add_food_expiration: 4,
                 waiting_add_food_storage: 5,
                 waiting_add_food_image: 6,
                 waiting_delete_food: 7,
                 waiting_delete_food_number: 8,
                 waiting_add_category: 9
                 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[line]
  # ゲストログイン機能アクション（6.18 使用しないと考えコメントアウト）
  # def self.guest
  #   find_or_create_by!(email: 'guest@example.com') do |user|
  #     user.password = SecureRandom.urlsafe_base64
  #     user.name = 'ゲストユーザー'
  #   end
  # end

  # Lineログイン機能アクション
  def social_profile(provider)
    social_profiles.select { |sp| sp.provider == provider.to_s }.first
  end

  # OmniAuthから取得した認証情報を使って、ユーザーのソーシャルプロファイルを更新
  def set_values(omniauth)
    return if provider.to_s != omniauth['provider'].to_s || uid != omniauth['uid']

    credentials = omniauth['credentials']
    info = omniauth['info']

    access_token = credentials['refresh_token']
    access_secret = credentials['secret']
    credentials = credentials.to_json
    name = info['name']
  end

  def set_values_by_raw_info(raw_info)
    self.raw_info = raw_info.to_json
    save!
  end

  # Lineログインを判定
  def line_logged_in?
    provider == 'line'
  end
end
