require 'telegram/bot'

class BotController < ApplicationController
  def index
		TelegramMessenger.start
	end
end
