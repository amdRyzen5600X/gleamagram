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

pub type ChoosenInlineResult {
  ChoosenInlineResult(
    result_id: String,
    from: user.User,
    location: option.Option(message.Location),
    inline_message_id: option.Option(String),
    query: String,
  )
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

pub type ShippingQuery {
  ShippingQuery(
    id: String,
    from: user.User,
    invoice_payload: String,
    shipping_address: message.ShippingAddress,
  )
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

