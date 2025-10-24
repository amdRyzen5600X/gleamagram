import gleam/dynamic/decode
import gleam/option.{type Option}
import gleamagram/types/user.{type Chat, type User, chat_decoder, user_decoder}

pub type BusinessConnection {
  BusinessConnection(
    id: String,
    user: User,
    user_chat_id: Int,
    date: Int,
    rights: Option(BusinessBotRights),
    is_enabled: Bool,
  )
}

pub fn business_connection_decoder() -> decode.Decoder(BusinessConnection) {
  use id <- decode.field("id", decode.string)
  use user <- decode.field("user", user_decoder())
  use user_chat_id <- decode.field("user_chat_id", decode.int)
  use date <- decode.field("date", decode.int)
  use rights <- decode.field(
    "rights",
    decode.optional(business_bot_rights_decoder()),
  )
  use is_enabled <- decode.field("is_enabled", decode.bool)
  decode.success(BusinessConnection(
    id:,
    user:,
    user_chat_id:,
    date:,
    rights:,
    is_enabled:,
  ))
}

pub type BusinessBotRights {
  BusinessBotRights(
    can_reply: Option(Bool),
    can_read_messages: Option(Bool),
    can_delete_sent_messages: Option(Bool),
    can_delete_all_messages: Option(Bool),
    can_edit_name: Option(Bool),
    can_edit_bio: Option(Bool),
    can_edit_profile_photo: Option(Bool),
    can_edit_username: Option(Bool),
    can_change_gift_settings: Option(Bool),
    can_view_gifts_and_stars: Option(Bool),
    can_convert_gifts_to_stars: Option(Bool),
    can_transfer_and_upgrade_gifts: Option(Bool),
    can_transfer_stars: Option(Bool),
    can_manage_stories: Option(Bool),
  )
}

pub fn business_bot_rights_decoder() -> decode.Decoder(BusinessBotRights) {
  use can_reply <- decode.field("can_reply", decode.optional(decode.bool))
  use can_read_messages <- decode.field(
    "can_read_messages",
    decode.optional(decode.bool),
  )
  use can_delete_sent_messages <- decode.field(
    "can_delete_sent_messages",
    decode.optional(decode.bool),
  )
  use can_delete_all_messages <- decode.field(
    "can_delete_all_messages",
    decode.optional(decode.bool),
  )
  use can_edit_name <- decode.field(
    "can_edit_name",
    decode.optional(decode.bool),
  )
  use can_edit_bio <- decode.field("can_edit_bio", decode.optional(decode.bool))
  use can_edit_profile_photo <- decode.field(
    "can_edit_profile_photo",
    decode.optional(decode.bool),
  )
  use can_edit_username <- decode.field(
    "can_edit_username",
    decode.optional(decode.bool),
  )
  use can_change_gift_settings <- decode.field(
    "can_change_gift_settings",
    decode.optional(decode.bool),
  )
  use can_view_gifts_and_stars <- decode.field(
    "can_view_gifts_and_stars",
    decode.optional(decode.bool),
  )
  use can_convert_gifts_to_stars <- decode.field(
    "can_convert_gifts_to_stars",
    decode.optional(decode.bool),
  )
  use can_transfer_and_upgrade_gifts <- decode.field(
    "can_transfer_and_upgrade_gifts",
    decode.optional(decode.bool),
  )
  use can_transfer_stars <- decode.field(
    "can_transfer_stars",
    decode.optional(decode.bool),
  )
  use can_manage_stories <- decode.field(
    "can_manage_stories",
    decode.optional(decode.bool),
  )
  decode.success(BusinessBotRights(
    can_reply:,
    can_read_messages:,
    can_delete_sent_messages:,
    can_delete_all_messages:,
    can_edit_name:,
    can_edit_bio:,
    can_edit_profile_photo:,
    can_edit_username:,
    can_change_gift_settings:,
    can_view_gifts_and_stars:,
    can_convert_gifts_to_stars:,
    can_transfer_and_upgrade_gifts:,
    can_transfer_stars:,
    can_manage_stories:,
  ))
}

pub type BusinessMessagesDeleted {
  BusinessMessagesDeleted(
    business_connection_id: String,
    chat: Chat,
    message_ids: List(Int),
  )
}

pub fn business_messages_deleted_decoder() -> decode.Decoder(
  BusinessMessagesDeleted,
) {
  use business_connection_id <- decode.field(
    "business_connection_id",
    decode.string,
  )
  use chat <- decode.field("chat", chat_decoder())
  use message_ids <- decode.field("message_ids", decode.list(decode.int))
  decode.success(BusinessMessagesDeleted(
    business_connection_id:,
    chat:,
    message_ids:,
  ))
}
