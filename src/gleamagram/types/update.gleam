import gleam/dynamic/decode
import gleam/option.{type Option}
import gleamagram/types/business
import gleamagram/types/file
import gleamagram/types/message
import gleamagram/types/query
import gleamagram/types/user

pub type Update {
  Update(
    update_id: Int,
    message: Option(message.Message),
    edited_message: Option(message.Message),
    channel_post: Option(message.Message),
    business_connection: Option(business.BusinessConnection),
    business_message: Option(message.Message),
    edited_business_message: Option(message.Message),
    deleted_business_message: Option(business.BusinessMessagesDeleted),
    message_reaction: Option(message.MessageReactionUpdated),
    message_reaction_count: Option(message.MessageReactionCountUpdated),
    inline_query: Option(query.InlineQuery),
    chosen_inline_result: Option(query.ChoosenInlineResult),
    callback_query: Option(query.CallbackQuery),
    shipping_query: Option(query.ShippingQuery),
    pre_checkout_query: Option(query.PreCheckoutQuery),
    purchased_paid_media: Option(file.PaidMediaPurchased),
    poll: Option(message.Poll),
    poll_answer: Option(message.PollAnswer),
    my_chat_member: Option(user.ChatMemberUpdated),
    chat_member: Option(user.ChatMemberUpdated),
    chat_join_requested: Option(user.ChatInviteLink),
    chat_boost: Option(user.ChatBoostUpdated),
    removed_chat_boost: Option(user.ChatBoostRemoved),
  )
}

pub fn update_decoder() -> decode.Decoder(Update) {
  use update_id <- decode.field("update_id", decode.int)
  use message <- decode.field(
    "message",
    decode.optional(message.message_decoder()),
  )
  use edited_message <- decode.field(
    "edited_message",
    decode.optional(message.message_decoder()),
  )
  use channel_post <- decode.field(
    "channel_post",
    decode.optional(message.message_decoder()),
  )
  use business_connection <- decode.field(
    "business_connection",
    decode.optional(business.business_connection_decoder()),
  )
  use business_message <- decode.field(
    "business_message",
    decode.optional(message.message_decoder()),
  )
  use edited_business_message <- decode.field(
    "edited_business_message",
    decode.optional(message.message_decoder()),
  )
  use deleted_business_message <- decode.field(
    "deleted_business_message",
    decode.optional(business.business_messages_deleted_decoder()),
  )
  use message_reaction <- decode.field(
    "message_reaction",
    decode.optional(message.message_reaction_updated_decoder()),
  )
  use message_reaction_count <- decode.field(
    "message_reaction_count",
    decode.optional(message.message_reaction_count_updated_decoder()),
  )
  use inline_query <- decode.field(
    "inline_query",
    decode.optional(query.inline_query_decoder()),
  )
  use chosen_inline_result <- decode.field(
    "chosen_inline_result",
    decode.optional(query.choosen_inline_result_decoder()),
  )
  use callback_query <- decode.field(
    "callback_query",
    decode.optional(query.callback_query_decoder()),
  )
  use shipping_query <- decode.field(
    "shipping_query",
    decode.optional(query.shipping_query_decoder()),
  )
  use pre_checkout_query <- decode.field(
    "pre_checkout_query",
    decode.optional(query.pre_checkout_query_decoder()),
  )
  use purchased_paid_media <- decode.field(
    "purchased_paid_media",
    decode.optional(file.paid_media_purchased_decoder()),
  )
  use poll <- decode.field("poll", decode.optional(message.poll_decoder()))
  use poll_answer <- decode.field(
    "poll_answer",
    decode.optional(message.poll_answer_decoder()),
  )
  use my_chat_member <- decode.field(
    "my_chat_member",
    decode.optional(user.chat_member_updated_decoder()),
  )
  use chat_member <- decode.field(
    "chat_member",
    decode.optional(user.chat_member_updated_decoder()),
  )
  use chat_join_requested <- decode.field(
    "chat_join_requested",
    decode.optional(user.chat_invite_link_decoder()),
  )
  use chat_boost <- decode.field(
    "chat_boost",
    decode.optional(user.chat_boost_updated_decoder()),
  )
  use removed_chat_boost <- decode.field(
    "removed_chat_boost",
    decode.optional(user.chat_boost_removed_decoder()),
  )
  decode.success(Update(
    update_id:,
    message:,
    edited_message:,
    channel_post:,
    business_connection:,
    business_message:,
    edited_business_message:,
    deleted_business_message:,
    message_reaction:,
    message_reaction_count:,
    inline_query:,
    chosen_inline_result:,
    callback_query:,
    shipping_query:,
    pre_checkout_query:,
    purchased_paid_media:,
    poll:,
    poll_answer:,
    my_chat_member:,
    chat_member:,
    chat_join_requested:,
    chat_boost:,
    removed_chat_boost:,
  ))
}
