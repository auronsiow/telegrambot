class HelpExpression < Expression
  SYNTAX = I18n.t 'command.help'

  def evaluate(str, bot, message)
    if str == SYNTAX
      text = "Here are the commands I can understand:\n"
      bot.api.send_message(chat_id: message.chat.id, text: text)
      text = (I18n.t 'command').map do |key, value|
        "`#{value}` - #{(I18n.t 'command_desc')[key]}"
      end
      text = text.join("\n")
      bot.api.send_message(chat_id: message.chat.id, text: text, parse_mode: 'Markdown')
      true
    else
      false
    end
  end
end
