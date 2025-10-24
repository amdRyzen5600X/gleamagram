import gleam/httpc
import gleam/option.{type Option, None}
import gleamagram/types/message.{type Message}

pub type MessageHandler =
  fn(Message) -> Nil

pub type CallbackHandler =
  fn(CallbackInfo) -> Nil

pub type CallbackInfo {
  CallbackInfo(data: String)
}

pub type Bot {
  Bot(config: Config)
}

pub type Dispatcher {
  Dispatcher(
    http_client: httpc.Configuration,
    bot: Bot,
    message_handler: Option(MessageHandler),
    callback_handler: Option(CallbackHandler),
  )
}

pub type Config {
  Config(server_url: String, token: String)
}

pub fn new_bot(token: String) -> Bot {
  let config = Config("https://api.telegram.org/", token)
  Bot(config)
}

pub fn new_dispatcher(bot: Bot) -> Dispatcher {
  let client = httpc.configure()
  Dispatcher(client, bot, None, None)
}
