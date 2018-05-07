class TelegramMessenger
  @@expressions = (I18n.t 'expression_class').map do |e|
    e.constantize.new
  end

  @@token = Rails.application.secrets.telegram_bot_key

  def self.start
    Telegram::Bot::Client.run(@@token) do |bot|
      bot.listen do |message|
        @@expressions.each do |e|
          break if e.evaluate(message.text, bot, message)
        end
      end
    end
  end
end
