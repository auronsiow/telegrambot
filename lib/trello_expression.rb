class TrelloExpression < Expression
	SYNTAX = "/GetBugs"

	def evaluate(str, bot, message)
		if (str == SYNTAX) 
			bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
			true
		else
			false
		end
	end
end