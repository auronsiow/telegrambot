class ByeExpression < Expression
  SYNTAX = I18n.t 'command.end'

  def evaluate(str, bot, message)
    if str == SYNTAX
      bot.api.send_message(chat_id: message.chat.id, text: "Goodbye, #{message.from.first_name}")
      true
    else
      false
    end
  end
end
