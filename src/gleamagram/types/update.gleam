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

