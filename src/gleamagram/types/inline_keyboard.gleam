import gleam/dynamic/decode
import gleam/option.{type Option}

pub type InlineKeyboardMarkup {
  InlineKeyboardMarkup(inline_keyboard: List(InlineKeyboardButton))
}

pub fn inline_keyboard_markup_decoder() -> decode.Decoder(InlineKeyboardMarkup) {
  use inline_keyboard <- decode.field(
    "inline_keyboard",
    decode.list(inline_keyboard_button_decoder()),
  )
  decode.success(InlineKeyboardMarkup(inline_keyboard:))
}

pub type InlineKeyboardButton {
  InlineKeyboardButton(
    text: String,
    url: Option(String),
    callback_data: Option(String),
    web_app: Option(WebAppInfo),
    login_url: Option(LoginUrl),
    switch_inline_query: Option(String),
    switch_inline_query_current_chat: Option(String),
    switch_inline_query_chosen_chat: Option(SwitchInlineQueryChosenChat),
    copy_text: Option(CopyTextButton),
    callback_game: Option(CallbackGame),
    pay: Option(Bool),
  )
}

pub fn inline_keyboard_button_decoder() -> decode.Decoder(InlineKeyboardButton) {
  use text <- decode.field("text", decode.string)
  use url <- decode.field("url", decode.optional(decode.string))
  use callback_data <- decode.field(
    "callback_data",
    decode.optional(decode.string),
  )
  use web_app <- decode.field(
    "web_app",
    decode.optional(web_app_info_decoder()),
  )
  use login_url <- decode.field(
    "login_url",
    decode.optional(login_url_decoder()),
  )
  use switch_inline_query <- decode.field(
    "switch_inline_query",
    decode.optional(decode.string),
  )
  use switch_inline_query_current_chat <- decode.field(
    "switch_inline_query_current_chat",
    decode.optional(decode.string),
  )
  use switch_inline_query_chosen_chat <- decode.field(
    "switch_inline_query_chosen_chat",
    decode.optional(switch_inline_query_chosen_chat_decoder()),
  )
  use copy_text <- decode.field(
    "copy_text",
    decode.optional(copy_text_button_decoder()),
  )
  use callback_game <- decode.field(
    "callback_game",
    decode.optional(callback_game_decoder()),
  )
  use pay <- decode.field("pay", decode.optional(decode.bool))
  decode.success(InlineKeyboardButton(
    text:,
    url:,
    callback_data:,
    web_app:,
    login_url:,
    switch_inline_query:,
    switch_inline_query_current_chat:,
    switch_inline_query_chosen_chat:,
    copy_text:,
    callback_game:,
    pay:,
  ))
}

pub type CallbackGame {
  CallbackGame
}

pub fn callback_game_decoder() -> decode.Decoder(CallbackGame) {
  use variant <- decode.then(decode.string)
  case variant {
    _ -> decode.success(CallbackGame)
  }
}

pub type CopyTextButton {
  CopyTextButton(text: String)
}

pub fn copy_text_button_decoder() -> decode.Decoder(CopyTextButton) {
  use text <- decode.field("text", decode.string)
  decode.success(CopyTextButton(text:))
}

pub type SwitchInlineQueryChosenChat {
  SwitchInlineQueryChosenChat(
    query: String,
    allow_user_chats: Option(Bool),
    allow_bot_chats: Option(Bool),
    allow_group_chats: Option(Bool),
    allow_channel_chats: Option(Bool),
  )
}

pub fn switch_inline_query_chosen_chat_decoder() -> decode.Decoder(
  SwitchInlineQueryChosenChat,
) {
  use query <- decode.field("query", decode.string)
  use allow_user_chats <- decode.field(
    "allow_user_chats",
    decode.optional(decode.bool),
  )
  use allow_bot_chats <- decode.field(
    "allow_bot_chats",
    decode.optional(decode.bool),
  )
  use allow_group_chats <- decode.field(
    "allow_group_chats",
    decode.optional(decode.bool),
  )
  use allow_channel_chats <- decode.field(
    "allow_channel_chats",
    decode.optional(decode.bool),
  )
  decode.success(SwitchInlineQueryChosenChat(
    query:,
    allow_user_chats:,
    allow_bot_chats:,
    allow_group_chats:,
    allow_channel_chats:,
  ))
}

pub type LoginUrl {
  LoginUrl(
    url: String,
    forward_text: Option(String),
    bot_username: Option(String),
    request_write_access: Option(Bool),
  )
}

pub fn login_url_decoder() -> decode.Decoder(LoginUrl) {
  use url <- decode.field("url", decode.string)
  use forward_text <- decode.field(
    "forward_text",
    decode.optional(decode.string),
  )
  use bot_username <- decode.field(
    "bot_username",
    decode.optional(decode.string),
  )
  use request_write_access <- decode.field(
    "request_write_access",
    decode.optional(decode.bool),
  )
  decode.success(LoginUrl(
    url:,
    forward_text:,
    bot_username:,
    request_write_access:,
  ))
}

pub type WebAppInfo {
  WebAppInfo(url: String)
}

pub fn web_app_info_decoder() -> decode.Decoder(WebAppInfo) {
  use url <- decode.field("url", decode.string)
  decode.success(WebAppInfo(url:))
}

pub type WebAppData {
  WebAppData(data: String, button_text: String)
}

pub fn web_app_data_decoder() -> decode.Decoder(WebAppData) {
  use data <- decode.field("data", decode.string)
  use button_text <- decode.field("button_text", decode.string)
  decode.success(WebAppData(data:, button_text:))
}
