class InvalidExpression < Expression
  def evaluate(str, bot, message)
    bot.api.send_message(chat_id: message.chat.id, text: "You DonkEY! I can't process #{str} command.")
  end
end
