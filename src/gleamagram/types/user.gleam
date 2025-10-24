import gleam/dynamic/decode
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

pub fn user_decoder() -> decode.Decoder(User) {
  use id <- decode.field("id", decode.int)
  use is_bot <- decode.field("is_bot", decode.bool)
  use first_name <- decode.field("first_name", decode.string)
  use last_name <- decode.field("last_name", decode.optional(decode.string))
  use username <- decode.field("username", decode.optional(decode.string))
  use language_code <- decode.field(
    "language_code",
    decode.optional(decode.string),
  )
  use is_premium <- decode.field("is_premium", decode.optional(decode.bool))
  use added_to_attachment_menu <- decode.field(
    "added_to_attachment_menu",
    decode.optional(decode.bool),
  )
  use can_join_groups <- decode.field(
    "can_join_groups",
    decode.optional(decode.bool),
  )
  use can_read_all_group_messages <- decode.field(
    "can_read_all_group_messages",
    decode.optional(decode.bool),
  )
  use support_inline_queries <- decode.field(
    "support_inline_queries",
    decode.optional(decode.bool),
  )
  use can_connect_to_business <- decode.field(
    "can_connect_to_business",
    decode.optional(decode.bool),
  )
  use has_main_wep_app <- decode.field(
    "has_main_wep_app",
    decode.optional(decode.bool),
  )
  decode.success(User(
    id:,
    is_bot:,
    first_name:,
    last_name:,
    username:,
    language_code:,
    is_premium:,
    added_to_attachment_menu:,
    can_join_groups:,
    can_read_all_group_messages:,
    support_inline_queries:,
    can_connect_to_business:,
    has_main_wep_app:,
  ))
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

pub fn chat_decoder() -> decode.Decoder(Chat) {
  use id <- decode.field("id", decode.int)
  use chat_type <- decode.field("chat_type", decode.string)
  use title <- decode.field("title", decode.optional(decode.string))
  use username <- decode.field("username", decode.optional(decode.string))
  use first_name <- decode.field("first_name", decode.optional(decode.string))
  use last_name <- decode.field("last_name", decode.optional(decode.string))
  use is_forum <- decode.field("is_forum", decode.optional(decode.bool))
  decode.success(Chat(
    id:,
    chat_type:,
    title:,
    username:,
    first_name:,
    last_name:,
    is_forum:,
  ))
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
  InvalidChatMember
}

pub fn chat_member_decoder() -> decode.Decoder(ChatMember) {
  use variant <- decode.field("type", decode.string)
  case variant {
    "chat_member_owner" -> {
      use status <- decode.field("status", decode.string)
      use user <- decode.field("user", user_decoder())
      use is_anonymous <- decode.field("is_anonymous", decode.bool)
      use custom_title <- decode.field(
        "custom_title",
        decode.optional(decode.string),
      )
      decode.success(ChatMemberOwner(
        status:,
        user:,
        is_anonymous:,
        custom_title:,
      ))
    }
    "chat_member_administrator" -> {
      use status <- decode.field("status", decode.string)
      use user <- decode.field("user", user_decoder())
      use can_be_edited <- decode.field("can_be_edited", decode.bool)
      use is_anonymous <- decode.field("is_anonymous", decode.bool)
      use can_manage_chat <- decode.field("can_manage_chat", decode.bool)
      use can_delete_messages <- decode.field(
        "can_delete_messages",
        decode.bool,
      )
      use can_manage_video_chats <- decode.field(
        "can_manage_video_chats",
        decode.bool,
      )
      use can_restrict_members <- decode.field(
        "can_restrict_members",
        decode.bool,
      )
      use can_promote_members <- decode.field(
        "can_promote_members",
        decode.bool,
      )
      use can_change_info <- decode.field("can_change_info", decode.bool)
      use can_invite_users <- decode.field("can_invite_users", decode.bool)
      use can_post_stories <- decode.field("can_post_stories", decode.bool)
      use can_edit_stories <- decode.field("can_edit_stories", decode.bool)
      use can_delete_stories <- decode.field("can_delete_stories", decode.bool)
      use can_post_messages <- decode.field(
        "can_post_messages",
        decode.optional(decode.bool),
      )
      use can_edit_messages <- decode.field(
        "can_edit_messages",
        decode.optional(decode.bool),
      )
      use can_pin_messages <- decode.field(
        "can_pin_messages",
        decode.optional(decode.bool),
      )
      use can_manage_topics <- decode.field(
        "can_manage_topics",
        decode.optional(decode.bool),
      )
      use custom_title <- decode.field(
        "custom_title",
        decode.optional(decode.string),
      )
      decode.success(ChatMemberAdministrator(
        status:,
        user:,
        can_be_edited:,
        is_anonymous:,
        can_manage_chat:,
        can_delete_messages:,
        can_manage_video_chats:,
        can_restrict_members:,
        can_promote_members:,
        can_change_info:,
        can_invite_users:,
        can_post_stories:,
        can_edit_stories:,
        can_delete_stories:,
        can_post_messages:,
        can_edit_messages:,
        can_pin_messages:,
        can_manage_topics:,
        custom_title:,
      ))
    }
    "chat_member_member" -> {
      use status <- decode.field("status", decode.string)
      use user <- decode.field("user", user_decoder())
      use until_date <- decode.field("until_date", decode.optional(decode.int))
      decode.success(ChatMemberMember(status:, user:, until_date:))
    }
    "chat_member_restricted" -> {
      use status <- decode.field("status", decode.string)
      use user <- decode.field("user", user_decoder())
      use is_member <- decode.field("is_member", decode.bool)
      use can_send_messages <- decode.field("can_send_messages", decode.bool)
      use can_send_audios <- decode.field("can_send_audios", decode.bool)
      use can_send_documents <- decode.field("can_send_documents", decode.bool)
      use can_send_photos <- decode.field("can_send_photos", decode.bool)
      use can_send_videos <- decode.field("can_send_videos", decode.bool)
      use can_send_video_notes <- decode.field(
        "can_send_video_notes",
        decode.bool,
      )
      use can_send_voice_notes <- decode.field(
        "can_send_voice_notes",
        decode.bool,
      )
      use can_send_polls <- decode.field("can_send_polls", decode.bool)
      use can_send_other_messages <- decode.field(
        "can_send_other_messages",
        decode.bool,
      )
      use can_add_web_page_previews <- decode.field(
        "can_add_web_page_previews",
        decode.bool,
      )
      use can_change_info <- decode.field("can_change_info", decode.bool)
      use can_invite_users <- decode.field("can_invite_users", decode.bool)
      use can_pin_messages <- decode.field("can_pin_messages", decode.bool)
      use can_manage_topics <- decode.field("can_manage_topics", decode.bool)
      use until_date <- decode.field("until_date", decode.int)
      decode.success(ChatMemberRestricted(
        status:,
        user:,
        is_member:,
        can_send_messages:,
        can_send_audios:,
        can_send_documents:,
        can_send_photos:,
        can_send_videos:,
        can_send_video_notes:,
        can_send_voice_notes:,
        can_send_polls:,
        can_send_other_messages:,
        can_add_web_page_previews:,
        can_change_info:,
        can_invite_users:,
        can_pin_messages:,
        can_manage_topics:,
        until_date:,
      ))
    }
    "chat_member_left" -> {
      use status <- decode.field("status", decode.string)
      use user <- decode.field("user", user_decoder())
      decode.success(ChatMemberLeft(status:, user:))
    }
    "chat_member_banned" -> {
      use status <- decode.field("status", decode.string)
      use user <- decode.field("user", user_decoder())
      use until_date <- decode.field("until_date", decode.int)
      decode.success(ChatMemberBanned(status:, user:, until_date:))
    }
    _ -> decode.failure(InvalidChatMember, "ChatMember")
  }
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

pub fn chat_member_updated_decoder() -> decode.Decoder(ChatMemberUpdated) {
  use chat <- decode.field("chat", chat_decoder())
  use from <- decode.field("from", user_decoder())
  use date <- decode.field("date", decode.int)
  use old_chat_member <- decode.field("old_chat_member", chat_member_decoder())
  use new_chat_member <- decode.field("new_chat_member", chat_member_decoder())
  use invite_link <- decode.field(
    "invite_link",
    decode.optional(chat_invite_link_decoder()),
  )
  use via_join_request <- decode.field(
    "via_join_request",
    decode.optional(decode.bool),
  )
  use via_chat_folder_invite_link <- decode.field(
    "via_chat_folder_invite_link",
    decode.optional(decode.bool),
  )
  decode.success(ChatMemberUpdated(
    chat:,
    from:,
    date:,
    old_chat_member:,
    new_chat_member:,
    invite_link:,
    via_join_request:,
    via_chat_folder_invite_link:,
  ))
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

pub fn chat_join_request_decoder() -> decode.Decoder(ChatJoinRequest) {
  use chat <- decode.field("chat", chat_decoder())
  use from <- decode.field("from", user_decoder())
  use user_chat_id <- decode.field("user_chat_id", decode.int)
  use date <- decode.field("date", decode.int)
  use bio <- decode.field("bio", decode.optional(decode.string))
  use invite_link <- decode.field(
    "invite_link",
    decode.optional(chat_invite_link_decoder()),
  )
  decode.success(ChatJoinRequest(
    chat:,
    from:,
    user_chat_id:,
    date:,
    bio:,
    invite_link:,
  ))
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

pub fn chat_invite_link_decoder() -> decode.Decoder(ChatInviteLink) {
  use invite_link <- decode.field("invite_link", decode.string)
  use creator <- decode.field("creator", user_decoder())
  use creates_join_request <- decode.field("creates_join_request", decode.bool)
  use is_primary <- decode.field("is_primary", decode.bool)
  use is_revoked <- decode.field("is_revoked", decode.bool)
  use name <- decode.field("name", decode.optional(decode.string))
  use expire_date <- decode.field("expire_date", decode.optional(decode.int))
  use member_limit <- decode.field("member_limit", decode.optional(decode.int))
  use pending_join_request_count <- decode.field(
    "pending_join_request_count",
    decode.optional(decode.int),
  )
  use subscription_period <- decode.field(
    "subscription_period",
    decode.optional(decode.int),
  )
  use subscription_price <- decode.field(
    "subscription_price",
    decode.optional(decode.int),
  )
  decode.success(ChatInviteLink(
    invite_link:,
    creator:,
    creates_join_request:,
    is_primary:,
    is_revoked:,
    name:,
    expire_date:,
    member_limit:,
    pending_join_request_count:,
    subscription_period:,
    subscription_price:,
  ))
}

pub type ChatBoostUpdated {
  ChatBoostUpdated(chat: Chat, boost: ChatBoost)
}

pub fn chat_boost_updated_decoder() -> decode.Decoder(ChatBoostUpdated) {
  use chat <- decode.field("chat", chat_decoder())
  use boost <- decode.field("boost", chat_boost_decoder())
  decode.success(ChatBoostUpdated(chat:, boost:))
}

pub type ChatBoost {
  ChatBoost(
    boost_id: String,
    add_date: Int,
    expiration_date: Int,
    source: ChatBoostSource,
  )
}

pub fn chat_boost_decoder() -> decode.Decoder(ChatBoost) {
  use boost_id <- decode.field("boost_id", decode.string)
  use add_date <- decode.field("add_date", decode.int)
  use expiration_date <- decode.field("expiration_date", decode.int)
  use source <- decode.field("source", chat_boost_source_decoder())
  decode.success(ChatBoost(boost_id:, add_date:, expiration_date:, source:))
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
  InvalidChatBoostSource
}

pub fn chat_boost_source_decoder() -> decode.Decoder(ChatBoostSource) {
  use variant <- decode.field("type", decode.string)
  case variant {
    "chat_boost_source_premium" -> {
      use source <- decode.field("source", decode.string)
      use user <- decode.field("user", user_decoder())
      decode.success(ChatBoostSourcePremium(source:, user:))
    }
    "chat_boost_source_gift_code" -> {
      use source <- decode.field("source", decode.string)
      use user <- decode.field("user", user_decoder())
      decode.success(ChatBoostSourceGiftCode(source:, user:))
    }
    "chat_boost_source_giveaway" -> {
      use source <- decode.field("source", decode.string)
      use giveaway_message_id <- decode.field("giveaway_message_id", decode.int)
      use user <- decode.field("user", decode.optional(user_decoder()))
      use prize_star_count <- decode.field(
        "prize_star_count",
        decode.optional(decode.int),
      )
      use is_unclaimed <- decode.field(
        "is_unclaimed",
        decode.optional(decode.bool),
      )
      decode.success(ChatBoostSourceGiveaway(
        source:,
        giveaway_message_id:,
        user:,
        prize_star_count:,
        is_unclaimed:,
      ))
    }
    _ -> decode.failure(InvalidChatBoostSource, "ChatBoostSource")
  }
}

pub type ChatBoostRemoved {
  ChatBoostRemoved(
    chat: Chat,
    boost_id: String,
    remove_date: Int,
    source: ChatBoost,
  )
}

pub fn chat_boost_removed_decoder() -> decode.Decoder(ChatBoostRemoved) {
  use chat <- decode.field("chat", chat_decoder())
  use boost_id <- decode.field("boost_id", decode.string)
  use remove_date <- decode.field("remove_date", decode.int)
  use source <- decode.field("source", chat_boost_decoder())
  decode.success(ChatBoostRemoved(chat:, boost_id:, remove_date:, source:))
}
