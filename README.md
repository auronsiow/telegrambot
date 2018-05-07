# Telegram Bot with User Command Parser

A simple rails implementing naive Telegram Bot listener. This bot is able to understand a few user commands.
Refer to config/locale/en.yml for the list.

* `expression.rb` is the base class; all others inherits from this with their customized functionalities.

* `telegram_messenger.rb` consumes all the expressions by *chaining* and processing them in a *Pipe and Filter* manner.

* `config/secrets.yml` should be given with a valid `telegram_bot_key` in production. You may find this from Bot Father.