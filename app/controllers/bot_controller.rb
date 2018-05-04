require 'telegram/bot'
class BotController < ApplicationController
  def index
  	token = ''

  	Telegram::Bot::Client.run(token) do |bot|
		  bot.listen do |message|
		  	binding.pry
		    case message.text
			    when '/start'
			      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
			    when '/stop'
			      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
			    when '/hi'
			    	bot.api.send_message(chat_id: message.chat.id, text: "Hello there! Salty $33.50")
			    else
			    	bot.api.send_message(chat_id: message.chat.id, text: "I can't process that command yet. You DonkEY!")
			    end
		  	end
			end
		end
end
