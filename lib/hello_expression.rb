class HelloExpression < Expression
  SYNTAX = I18n.t 'command.hello'

  def evaluate(str, bot, message)
    if str == SYNTAX
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
      true
    else
      false
    end
  end
end
