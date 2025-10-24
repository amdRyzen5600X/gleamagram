import gleam/option.{type Option}

pub type User {
  User(
    id: Int,
    is_bot: Bool,
    first_name: String,
    last_name: Option(String),
    username: Option(String),
    language_code: Option(String),
    is_premium: Option(Bool),
    added_to_attachment_menu: Option(Bool),
    can_join_groups: Option(Bool),
    can_read_all_group_messages: Option(Bool),
    support_inline_queries: Option(Bool),
    can_connect_to_business: Option(Bool),
    has_main_wep_app: Option(Bool),
  )
}

pub type Chat {
  Chat(
    id: Int,
    chat_type: String,
    title: Option(String),
    username: Option(String),
    first_name: Option(String),
    last_name: Option(String),
    is_forum: Option(Bool),
  )
}

pub type ChatMember {
  ChatMemberOwner(
    status: String,
    user: User,
    is_anonymous: Bool,
    custom_title: Option(String),
  )
  ChatMemberAdministrator(
    status: String,
    user: User,
    can_be_edited: Bool,
    is_anonymous: Bool,
    can_manage_chat: Bool,
    can_delete_messages: Bool,
    can_manage_video_chats: Bool,
    can_restrict_members: Bool,
    can_promote_members: Bool,
    can_change_info: Bool,
    can_invite_users: Bool,
    can_post_stories: Bool,
    can_edit_stories: Bool,
    can_delete_stories: Bool,
    can_post_messages: Option(Bool),
    can_edit_messages: Option(Bool),
    can_pin_messages: Option(Bool),
    can_manage_topics: Option(Bool),
    custom_title: Option(String),
  )
  ChatMemberMember(status: String, user: User, until_date: Option(Int))
  ChatMemberRestricted(
    status: String,
    user: User,
    is_member: Bool,
    can_send_messages: Bool,
    can_send_audios: Bool,
    can_send_documents: Bool,
    can_send_photos: Bool,
    can_send_videos: Bool,
    can_send_video_notes: Bool,
    can_send_voice_notes: Bool,
    can_send_polls: Bool,
    can_send_other_messages: Bool,
    can_add_web_page_previews: Bool,
    can_change_info: Bool,
    can_invite_users: Bool,
    can_pin_messages: Bool,
    can_manage_topics: Bool,
    until_date: Int,
  )
  ChatMemberLeft(status: String, user: User)
  ChatMemberBanned(status: String, user: User, until_date: Int)
}

pub type ChatMemberUpdated {
  ChatMemberUpdated(
    chat: Chat,
    from: User,
    date: Int,
    old_chat_member: ChatMember,
    new_chat_member: ChatMember,
    invite_link: option.Option(ChatInviteLink),
    via_join_request: option.Option(Bool),
    via_chat_folder_invite_link: option.Option(Bool),
  )
}

pub type ChatJoinRequest {
  ChatJoinRequest(
    chat: Chat,
    from: User,
    user_chat_id: Int,
    date: Int,
    bio: Option(String),
    invite_link: Option(ChatInviteLink),
  )
}

pub type ChatInviteLink {
  ChatInviteLink(
    invite_link: String,
    creator: User,
    creates_join_request: Bool,
    is_primary: Bool,
    is_revoked: Bool,
    name: Option(String),
    expire_date: Option(Int),
    member_limit: Option(Int),
    pending_join_request_count: Option(Int),
    subscription_period: Option(Int),
    subscription_price: Option(Int),
  )
}

pub type ChatBoostUpdated {
  ChatBoostUpdated(chat: Chat, boost: ChatBoost)
}

pub type ChatBoost {
  ChatBoost(
    boost_id: String,
    add_date: Int,
    expiration_date: Int,
    source: ChatBoostSource,
  )
}

pub type ChatBoostSource {
  ChatBoostSourcePremium(source: String, user: User)
  ChatBoostSourceGiftCode(source: String, user: User)
  ChatBoostSourceGiveaway(
    source: String,
    giveaway_message_id: Int,
    user: Option(User),
    prize_star_count: Option(Int),
    is_unclaimed: Option(Bool),
  )
}

pub type ChatBoostRemoved {
  ChatBoostRemoved(
    chat: Chat,
    boost_id: String,
    remove_date: Int,
    source: ChatBoost,
  )
}
