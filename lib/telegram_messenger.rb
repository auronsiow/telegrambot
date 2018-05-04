class TelegramMessenger
	@@expressions = [] 
	@@expressions << HelloExpression.new
	@@expressions << ByeExpression.new
	@@expressions << SpecificUserExpression.new
	@@expressions << InvalidExpression.new
	
	@@token = ''

	def self.start

		 Telegram::Bot::Client.run(@@token) do |bot|
			  bot.listen do |message|
					@@expressions.each do |e|
						if e.evaluate(message.text, bot, message)
							break
						end
					end
				end
			end
	end

end