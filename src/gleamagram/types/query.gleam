import gleam/dynamic/decode
import gleam/option
import gleamagram/types/message
import gleamagram/types/user

pub type InlineQuery {
  InlineQuery(
    id: String,
    from: user.User,
    query: String,
    offset: String,
    chat_type: String,
    location: option.Option(message.Location),
  )
}

pub fn inline_query_decoder() -> decode.Decoder(InlineQuery) {
  use id <- decode.field("id", decode.string)
  use from <- decode.field("from", user.user_decoder())
  use query <- decode.field("query", decode.string)
  use offset <- decode.field("offset", decode.string)
  use chat_type <- decode.field("chat_type", decode.string)
  use location <- decode.field(
    "location",
    decode.optional(todo as "Decoder for message.Location"),
  )
  decode.success(InlineQuery(id:, from:, query:, offset:, chat_type:, location:))
}

pub type ChoosenInlineResult {
  ChoosenInlineResult(
    result_id: String,
    from: user.User,
    location: option.Option(message.Location),
    inline_message_id: option.Option(String),
    query: String,
  )
}

pub fn choosen_inline_result_decoder() -> decode.Decoder(ChoosenInlineResult) {
  use result_id <- decode.field("result_id", decode.string)
  use from <- decode.field("from", user.user_decoder())
  use location <- decode.field(
    "location",
    decode.optional(todo as "Decoder for message.Location"),
  )
  use inline_message_id <- decode.field(
    "inline_message_id",
    decode.optional(decode.string),
  )
  use query <- decode.field("query", decode.string)
  decode.success(ChoosenInlineResult(
    result_id:,
    from:,
    location:,
    inline_message_id:,
    query:,
  ))
}

pub type CallbackQuery {
  CallbackQuery(
    id: String,
    from: user.User,
    message: option.Option(message.MaybeInaccessibleMessage),
    inline_message_id: option.Option(String),
    chat_instance: String,
    data: option.Option(String),
    game_short_name: option.Option(String),
  )
}

pub fn callback_query_decoder() -> decode.Decoder(CallbackQuery) {
  use id <- decode.field("id", decode.string)
  use from <- decode.field("from", user.user_decoder())
  use message <- decode.field(
    "message",
    decode.optional(todo as "Decoder for message.MaybeInaccessibleMessage"),
  )
  use inline_message_id <- decode.field(
    "inline_message_id",
    decode.optional(decode.string),
  )
  use chat_instance <- decode.field("chat_instance", decode.string)
  use data <- decode.field("data", decode.optional(decode.string))
  use game_short_name <- decode.field(
    "game_short_name",
    decode.optional(decode.string),
  )
  decode.success(CallbackQuery(
    id:,
    from:,
    message:,
    inline_message_id:,
    chat_instance:,
    data:,
    game_short_name:,
  ))
}

pub type ShippingQuery {
  ShippingQuery(
    id: String,
    from: user.User,
    invoice_payload: String,
    shipping_address: message.ShippingAddress,
  )
}

pub fn shipping_query_decoder() -> decode.Decoder(ShippingQuery) {
  use id <- decode.field("id", decode.string)
  use from <- decode.field("from", user.user_decoder())
  use invoice_payload <- decode.field("invoice_payload", decode.string)
  use shipping_address <- decode.field(
    "shipping_address",
    todo as "Decoder for message.ShippingAddress",
  )
  decode.success(ShippingQuery(id:, from:, invoice_payload:, shipping_address:))
}

pub type PreCheckoutQuery {
  PreCheckoutQuery(
    id: String,
    from: user.User,
    currency: String,
    total_amount: Int,
    invoice_payload: String,
    shipping_option_id: option.Option(String),
    order_info: option.Option(message.OrderInfo),
  )
}

pub fn pre_checkout_query_decoder() -> decode.Decoder(PreCheckoutQuery) {
  use id <- decode.field("id", decode.string)
  use from <- decode.field("from", user.user_decoder())
  use currency <- decode.field("currency", decode.string)
  use total_amount <- decode.field("total_amount", decode.int)
  use invoice_payload <- decode.field("invoice_payload", decode.string)
  use shipping_option_id <- decode.field(
    "shipping_option_id",
    decode.optional(decode.string),
  )
  use order_info <- decode.field(
    "order_info",
    decode.optional(todo as "Decoder for message.OrderInfo"),
  )
  decode.success(PreCheckoutQuery(
    id:,
    from:,
    currency:,
    total_amount:,
    invoice_payload:,
    shipping_option_id:,
    order_info:,
  ))
}
