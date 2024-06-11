# frozen_string_literal: true

namespace :line_notification do
  desc 'LINEBOT : 食材の消費期限の通知'
  task push_line_message_expiration_date: :environment do
    client = Line::Bot::Client.new do |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    end

    User.find_each do |user|
      # 今日から2日後までの消費期限を取得
      limit_expiration = user.foods.where(expiration_date: Date.today..2.days.from_now.to_date)

      limit_expiration.each do |f|
        expiration_notice = case f.expiration_date
                            when Date.today
                              '今日'
                            when Date.tomorrow
                              '明日'
                            else
                              f.expiration_date.strftime('%m月%d日')
                            end

        recipes = RakutenWebService::Recipe.small_categories.find { |c| c.name.match(f.name) }.ranking

        columns = recipes.map do |recipe|
          {
            thumbnailImageUrl: recipe['foodImageUrl'],
            title: (recipe['recipeTitle'][0..39] || ""), # タイトルを40文字以内に
            text: (recipe['recipeDescription'][0..59] || ""), # テキストを60文字以内に
            actions: [
              {
                type: 'uri',
                label: 'レシピを見る',
                uri: recipe['recipeUrl']
              }
            ]
          }
        end

        message1 = {
          type: 'text',
          text: "「#{f.name}」の期限は#{expiration_notice}です! 関連するレシピをご覧ください"
        }

        message2 = {
          type: 'template',
          altText: "「#{f.name}」の期限は#{expiration_notice}です! 関連するレシピをご覧ください。",
          template: {
            type: 'carousel',
            columns: columns.slice(0, 10) # カラムを最大10個に制限
          }
        }

        puts message1.to_json
        puts message2.to_json

        response1 = client.push_message(user.uid, message1)
        p response1

        response2 = client.push_message(user.uid, message2)
        p response2

        puts message1.to_json
        puts message2.to_json
      end
    end
  end
end

# docker compose exec web bash後
# rails line_notification:push_line_message_expiration_date
