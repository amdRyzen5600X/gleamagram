import gleam/option
import gleamagram/types/user

pub type BusinessConnection {
  BusinessConnection(
    id: String,
    user: user.User,
    user_chat_id: Int,
    date: Int,
    rights: option.Option(BusinessBotRights),
    is_enabled: Bool,
  )
}

pub type BusinessBotRights {
  BusinessBotRights(
    can_reply: option.Option(Bool),
    can_read_messages: option.Option(Bool),
    can_delete_sent_messages: option.Option(Bool),
    can_delete_all_messages: option.Option(Bool),
    can_edit_name: option.Option(Bool),
    can_edit_bio: option.Option(Bool),
    can_edit_profile_photo: option.Option(Bool),
    can_edit_username: option.Option(Bool),
    can_change_gift_settings: option.Option(Bool),
    can_view_gifts_and_stars: option.Option(Bool),
    can_convert_gifts_to_stars: option.Option(Bool),
    can_transfer_and_upgrade_gifts: option.Option(Bool),
    can_transfer_stars: option.Option(Bool),
    can_manage_stories: option.Option(Bool),
  )
}

pub type BusinessMessagesDeleted {
  BusinessMessagesDeleted(
    business_connection_id: String,
    chat: user.Chat,
    message_ids: List(Int),
  )
}
