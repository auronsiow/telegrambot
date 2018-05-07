class TrelloExpression < Expression
	SYNTAX = I18n.t "command.trello"

	def evaluate(str, bot, message)
		if (str == SYNTAX) 
			bot.api.send_message(chat_id: message.chat.id, text: "Below are the existing bugs from Embark Trello:")
			text = fetch_cards
			bot.api.send_message(chat_id: message.chat.id, text: text, parse_mode: "Markdown")
			true
		else
			false
		end
	end

	def fetch_cards
		listsFromBoard = JSON.parse(RestClient.get "https://api.trello.com/1/boards/3bES4ayn/lists?fields=name")
		listsFromBoard = get_cards_from_list(listsFromBoard, "Bugs")
		construct_markdown_message(listsFromBoard)
	end

  def get_cards_from_list(listsBelongingToBoard, expectedListName)
  	list = listsBelongingToBoard.detect { |list| list["name"] == expectedListName  }
   	listId = list["id"]

   	list = RestClient.get "https://api.trello.com/1/lists/#{listId}/cards?fields=name,shortUrl"
   	list = JSON.parse(list)
   	list = list.map { |key, value| {"name": key["name"], "url": key["shortUrl"]} }
   	list
  end

  def construct_markdown_message(list)
  	message = list.each_with_index.map { |value, index| 
  		"#{index+1}. [#{value[:name]}](#{value[:url]})"
  	}.join("\n")
  	message
  end
end