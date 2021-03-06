class SpecificUserExpression < Expression
  SYNTAX = I18n.t 'command.user'

  def evaluate(str, bot, message)
    if str == SYNTAX
      if message.from.username.casecmp('HanYangTan') == 0
        bot.api.send_message(chat_id: message.chat.id, text: 'Hello Salty $33.50!!')
      else
        bot.api.send_message(chat_id: message.chat.id, text: 'Rolling 年糕 in your tummy!')

        Time.now.sec.even? ?
        bot.api.send_photo(chat_id: message.chat.id, photo: 'https://ls.imgix.net/shows/thumbnails/Beyond-Boiling-Point.jpg?w=620&h=310&auto=compress,format&fit=crop')
        :
        bot.api.send_photo(chat_id: message.chat.id, photo: 'http://i18.photobucket.com/albums/b137/jos2829/Malaysian%202/niango1.jpg')
      end
      true
    else
      false
    end
  end
end
