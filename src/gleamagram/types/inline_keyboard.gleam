import gleam/option.{type Option}

pub type InlineKeyboardMarkup {
  InlineKeyboardMarkup(inline_keyboard: List(InlineKeyboardButton))
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

pub type CallbackGame {
  CallbackGame
}

pub type CopyTextButton {
  CopyTextButton(text: String)
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

pub type LoginUrl {
  LoginUrl(
    url: String,
    forward_text: Option(String),
    bot_username: Option(String),
    request_write_access: Option(Bool),
  )
}

pub type WebAppInfo {
  WebAppInfo(url: String)
}

pub type WebAppData {
  WebAppData(data: String, button_text: String)
}
