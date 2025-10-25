import gleam/dynamic/decode
import gleam/option.{type Option}
import gleamagram/types/file.{
  type Animation, type Audio, type Document, type PaidMediaInfo, type PhotoSize,
  type Video, type VideoNote, type Voice,
}
import gleamagram/types/inline_keyboard
import gleamagram/types/sticker.{type Sticker}
import gleamagram/types/user.{type Chat, type User}

pub type Message {
  Message(
    message_id: Int,
    message_thread_id: Option(Int),
    from: Option(User),
    sender_chat: Option(Chat),
    senser_boost_count: Option(Int),
    sender_business_bot: Option(User),
    date: Int,
    business_connection_id: Option(String),
    chat: Chat,
    forward_origin: Option(MessageOrigin),
    is_topic_message: Option(Bool),
    is_automatic_message: Option(Bool),
    reply_to_message: Option(Message),
    external_reply: Option(ExternalReplyInfo),
    quote: Option(TextQuote),
    reply_to_story: Option(Story),
    via_bot: Option(User),
    edit_date: Option(Int),
    has_protected_content: Option(Bool),
    is_from_offline: Option(Bool),
    media_group_id: Option(String),
    author_signature: Option(String),
    paid_star_count: Option(Int),
    text: Option(String),
    entities: List(MessageEntity),
    link_preview_options: Option(LinkPreviewOptions),
    effect_id: Option(String),
    animation: Option(Animation),
    audio: Option(Audio),
    document: Option(Document),
    paid_media: Option(PaidMediaInfo),
    photo: Option(List(PhotoSize)),
    sticker: Option(Sticker),
    story: Option(Story),
    video: Option(Video),
    video_note: Option(VideoNote),
    voice: Option(Voice),
    caption: Option(String),
    caption_entities: Option(List(MessageEntity)),
    show_caption_above_media: Option(Bool),
    has_media_spiler: Option(Bool),
    contact: Option(Contact),
    dice: Option(Dice),
    game: Option(Game),
    poll: Option(Poll),
    venue: Option(Venue),
    location: Option(Location),
    new_chat_members: Option(List(User)),
    left_chat_member: Option(User),
    new_chat_title: Option(String),
    new_chat_photo: Option(List(PhotoSize)),
    delete_chat_photo: Option(Bool),
    group_chat_created: Option(Bool),
    supergroup_chat_created: Option(Bool),
    channel_chat_photo: Option(Bool),
    message_auto_delete_timer_changed: Option(MessageAutoDeleteTimerChanged),
    migrate_to_chat_id: Option(Int),
    migrate_from_chat_id: Option(Int),
    pinned_message: Option(MaybeInaccessibleMessage),
    invoice: Option(Invoice),
    successful_payment: Option(SuccessfulPayment),
    refunded_payment: Option(RefundedPayment),
    users_shared: Option(UsersShared),
    chat_shared: Option(ChatShared),
    gift: Option(GiftInfo),
    unique_gift: Option(UniqueGiftInfo),
    connected_website: Option(String),
    write_access_allowed: Option(WriteAccessAllowed),
    passport_data: Option(PassportData),
    proximity_alert_triggered: Option(ProximityAlertTriggered),
    boost_added: Option(ChatBoostAdded),
    chat_background_set: Option(ChatBackground),
    forum_topic_created: Option(ForumTopicCreated),
    forum_topic_edited: Option(ForumTopicEdited),
    forum_topic_closed: Option(ForumTopicClosed),
    forum_topic_reopened: Option(ForumTopicReopened),
    general_forum_topic_hidden: Option(GeneralForumTopicHidden),
    general_forum_topic_unhidden: Option(GeneralForumTopicUnhidden),
    giveaway_created: Option(GiveawayCreated),
    giveaway: Option(Giveaway),
    giveaway_winners: Option(GiveawayWinners),
    giveaway_completed: Option(GiveawayCompleted),
    paid_message_price_changed: Option(PaidMessagePriceChanged),
    video_chat_scheduled: Option(VideoChatScheduled),
    video_chat_started: Option(VideoChatStarted),
    video_chat_ended: Option(VideoChatEnded),
    video_chat_participants_invited: Option(VideoChatParticipantsInvited),
    web_app_data: Option(inline_keyboard.WebAppData),
    reply_markup: Option(inline_keyboard.InlineKeyboardMarkup),
  )
}

pub fn message_decoder() -> decode.Decoder(Message) {
  use message_id <- decode.field("message_id", decode.int)
  use message_thread_id <- decode.field(
    "message_thread_id",
    decode.optional(decode.int),
  )
  use from <- decode.field("from", decode.optional(user.user_decoder()))
  use sender_chat <- decode.field(
    "sender_chat",
    decode.optional(user.chat_decoder()),
  )
  use senser_boost_count <- decode.field(
    "senser_boost_count",
    decode.optional(decode.int),
  )
  use sender_business_bot <- decode.field(
    "sender_business_bot",
    decode.optional(user.user_decoder()),
  )
  use date <- decode.field("date", decode.int)
  use business_connection_id <- decode.field(
    "business_connection_id",
    decode.optional(decode.string),
  )
  use chat <- decode.field("chat", user.chat_decoder())
  use forward_origin <- decode.field(
    "forward_origin",
    decode.optional(message_origin_decoder()),
  )
  use is_topic_message <- decode.field(
    "is_topic_message",
    decode.optional(decode.bool),
  )
  use is_automatic_message <- decode.field(
    "is_automatic_message",
    decode.optional(decode.bool),
  )
  use reply_to_message <- decode.field(
    "reply_to_message",
    decode.optional(message_decoder()),
  )
  use external_reply <- decode.field(
    "external_reply",
    decode.optional(external_reply_info_decoder()),
  )
  use quote <- decode.field("quote", decode.optional(text_quote_decoder()))
  use reply_to_story <- decode.field(
    "reply_to_story",
    decode.optional(story_decoder()),
  )
  use via_bot <- decode.field("via_bot", decode.optional(user.user_decoder()))
  use edit_date <- decode.field("edit_date", decode.optional(decode.int))
  use has_protected_content <- decode.field(
    "has_protected_content",
    decode.optional(decode.bool),
  )
  use is_from_offline <- decode.field(
    "is_from_offline",
    decode.optional(decode.bool),
  )
  use media_group_id <- decode.field(
    "media_group_id",
    decode.optional(decode.string),
  )
  use author_signature <- decode.field(
    "author_signature",
    decode.optional(decode.string),
  )
  use paid_star_count <- decode.field(
    "paid_star_count",
    decode.optional(decode.int),
  )
  use text <- decode.field("text", decode.optional(decode.string))
  use entities <- decode.field(
    "entities",
    decode.list(message_entity_decoder()),
  )
  use link_preview_options <- decode.field(
    "link_preview_options",
    decode.optional(link_preview_options_decoder()),
  )
  use effect_id <- decode.field("effect_id", decode.optional(decode.string))
  use animation <- decode.field(
    "animation",
    decode.optional(file.animation_decoder()),
  )
  use audio <- decode.field("audio", decode.optional(file.audio_decoder()))
  use document <- decode.field(
    "document",
    decode.optional(file.document_decoder()),
  )
  use paid_media <- decode.field(
    "paid_media",
    decode.optional(file.paid_media_info_decoder()),
  )
  use photo <- decode.field(
    "photo",
    decode.optional(decode.list(file.photo_size_decoder())),
  )
  use sticker <- decode.field(
    "sticker",
    decode.optional(sticker.sticker_decoder()),
  )
  use story <- decode.field("story", decode.optional(story_decoder()))
  use video <- decode.field("video", decode.optional(file.video_decoder()))
  use video_note <- decode.field(
    "video_note",
    decode.optional(file.video_note_decoder()),
  )
  use voice <- decode.field("voice", decode.optional(file.voice_decoder()))
  use caption <- decode.field("caption", decode.optional(decode.string))
  use caption_entities <- decode.field(
    "caption_entities",
    decode.optional(decode.list(message_entity_decoder())),
  )
  use show_caption_above_media <- decode.field(
    "show_caption_above_media",
    decode.optional(decode.bool),
  )
  use has_media_spiler <- decode.field(
    "has_media_spiler",
    decode.optional(decode.bool),
  )
  use contact <- decode.field("contact", decode.optional(contact_decoder()))
  use dice <- decode.field("dice", decode.optional(dice_decoder()))
  use game <- decode.field("game", decode.optional(game_decoder()))
  use poll <- decode.field("poll", decode.optional(poll_decoder()))
  use venue <- decode.field("venue", decode.optional(venue_decoder()))
  use location <- decode.field("location", decode.optional(location_decoder()))
  use new_chat_members <- decode.field(
    "new_chat_members",
    decode.optional(decode.list(user.user_decoder())),
  )
  use left_chat_member <- decode.field(
    "left_chat_member",
    decode.optional(user.user_decoder()),
  )
  use new_chat_title <- decode.field(
    "new_chat_title",
    decode.optional(decode.string),
  )
  use new_chat_photo <- decode.field(
    "new_chat_photo",
    decode.optional(decode.list(file.photo_size_decoder())),
  )
  use delete_chat_photo <- decode.field(
    "delete_chat_photo",
    decode.optional(decode.bool),
  )
  use group_chat_created <- decode.field(
    "group_chat_created",
    decode.optional(decode.bool),
  )
  use supergroup_chat_created <- decode.field(
    "supergroup_chat_created",
    decode.optional(decode.bool),
  )
  use channel_chat_photo <- decode.field(
    "channel_chat_photo",
    decode.optional(decode.bool),
  )
  use message_auto_delete_timer_changed <- decode.field(
    "message_auto_delete_timer_changed",
    decode.optional(message_auto_delete_timer_changed_decoder()),
  )
  use migrate_to_chat_id <- decode.field(
    "migrate_to_chat_id",
    decode.optional(decode.int),
  )
  use migrate_from_chat_id <- decode.field(
    "migrate_from_chat_id",
    decode.optional(decode.int),
  )
  use pinned_message <- decode.field(
    "pinned_message",
    decode.optional(maybe_inaccessible_message_decoder()),
  )
  use invoice <- decode.field("invoice", decode.optional(invoice_decoder()))
  use successful_payment <- decode.field(
    "successful_payment",
    decode.optional(successful_payment_decoder()),
  )
  use refunded_payment <- decode.field(
    "refunded_payment",
    decode.optional(refunded_payment_decoder()),
  )
  use users_shared <- decode.field(
    "users_shared",
    decode.optional(users_shared_decoder()),
  )
  use chat_shared <- decode.field(
    "chat_shared",
    decode.optional(chat_shared_decoder()),
  )
  use gift <- decode.field("gift", decode.optional(gift_info_decoder()))
  use unique_gift <- decode.field(
    "unique_gift",
    decode.optional(unique_gift_info_decoder()),
  )
  use connected_website <- decode.field(
    "connected_website",
    decode.optional(decode.string),
  )
  use write_access_allowed <- decode.field(
    "write_access_allowed",
    decode.optional(write_access_allowed_decoder()),
  )
  use passport_data <- decode.field(
    "passport_data",
    decode.optional(passport_data_decoder()),
  )
  use proximity_alert_triggered <- decode.field(
    "proximity_alert_triggered",
    decode.optional(proximity_alert_triggered_decoder()),
  )
  use boost_added <- decode.field(
    "boost_added",
    decode.optional(chat_boost_added_decoder()),
  )
  use chat_background_set <- decode.field(
    "chat_background_set",
    decode.optional(chat_background_decoder()),
  )
  use forum_topic_created <- decode.field(
    "forum_topic_created",
    decode.optional(forum_topic_created_decoder()),
  )
  use forum_topic_edited <- decode.field(
    "forum_topic_edited",
    decode.optional(forum_topic_edited_decoder()),
  )
  use forum_topic_closed <- decode.field(
    "forum_topic_closed",
    decode.optional(forum_topic_closed_decoder()),
  )
  use forum_topic_reopened <- decode.field(
    "forum_topic_reopened",
    decode.optional(forum_topic_reopened_decoder()),
  )
  use general_forum_topic_hidden <- decode.field(
    "general_forum_topic_hidden",
    decode.optional(general_forum_topic_hidden_decoder()),
  )
  use general_forum_topic_unhidden <- decode.field(
    "general_forum_topic_unhidden",
    decode.optional(general_forum_topic_unhidden_decoder()),
  )
  use giveaway_created <- decode.field(
    "giveaway_created",
    decode.optional(giveaway_created_decoder()),
  )
  use giveaway <- decode.field("giveaway", decode.optional(giveaway_decoder()))
  use giveaway_winners <- decode.field(
    "giveaway_winners",
    decode.optional(giveaway_winners_decoder()),
  )
  use giveaway_completed <- decode.field(
    "giveaway_completed",
    decode.optional(giveaway_completed_decoder()),
  )
  use paid_message_price_changed <- decode.field(
    "paid_message_price_changed",
    decode.optional(paid_message_price_changed_decoder()),
  )
  use video_chat_scheduled <- decode.field(
    "video_chat_scheduled",
    decode.optional(video_chat_scheduled_decoder()),
  )
  use video_chat_started <- decode.field(
    "video_chat_started",
    decode.optional(video_chat_started_decoder()),
  )
  use video_chat_ended <- decode.field(
    "video_chat_ended",
    decode.optional(video_chat_ended_decoder()),
  )
  use video_chat_participants_invited <- decode.field(
    "video_chat_participants_invited",
    decode.optional(video_chat_participants_invited_decoder()),
  )
  use web_app_data <- decode.field(
    "web_app_data",
    decode.optional(inline_keyboard.web_app_data_decoder()),
  )
  use reply_markup <- decode.field(
    "reply_markup",
    decode.optional(inline_keyboard.inline_keyboard_markup_decoder()),
  )
  decode.success(Message(
    message_id:,
    message_thread_id:,
    from:,
    sender_chat:,
    senser_boost_count:,
    sender_business_bot:,
    date:,
    business_connection_id:,
    chat:,
    forward_origin:,
    is_topic_message:,
    is_automatic_message:,
    reply_to_message:,
    external_reply:,
    quote:,
    reply_to_story:,
    via_bot:,
    edit_date:,
    has_protected_content:,
    is_from_offline:,
    media_group_id:,
    author_signature:,
    paid_star_count:,
    text:,
    entities:,
    link_preview_options:,
    effect_id:,
    animation:,
    audio:,
    document:,
    paid_media:,
    photo:,
    sticker:,
    story:,
    video:,
    video_note:,
    voice:,
    caption:,
    caption_entities:,
    show_caption_above_media:,
    has_media_spiler:,
    contact:,
    dice:,
    game:,
    poll:,
    venue:,
    location:,
    new_chat_members:,
    left_chat_member:,
    new_chat_title:,
    new_chat_photo:,
    delete_chat_photo:,
    group_chat_created:,
    supergroup_chat_created:,
    channel_chat_photo:,
    message_auto_delete_timer_changed:,
    migrate_to_chat_id:,
    migrate_from_chat_id:,
    pinned_message:,
    invoice:,
    successful_payment:,
    refunded_payment:,
    users_shared:,
    chat_shared:,
    gift:,
    unique_gift:,
    connected_website:,
    write_access_allowed:,
    passport_data:,
    proximity_alert_triggered:,
    boost_added:,
    chat_background_set:,
    forum_topic_created:,
    forum_topic_edited:,
    forum_topic_closed:,
    forum_topic_reopened:,
    general_forum_topic_hidden:,
    general_forum_topic_unhidden:,
    giveaway_created:,
    giveaway:,
    giveaway_winners:,
    giveaway_completed:,
    paid_message_price_changed:,
    video_chat_scheduled:,
    video_chat_started:,
    video_chat_ended:,
    video_chat_participants_invited:,
    web_app_data:,
    reply_markup:,
  ))
}

pub type MessageReactionCountUpdated {
  MessageReactionCountUpdated(
    chat: Chat,
    message_id: Int,
    date: Int,
    reactions: List(ReactionCount),
  )
}

pub fn message_reaction_count_updated_decoder() -> decode.Decoder(
  MessageReactionCountUpdated,
) {
  use chat <- decode.field("chat", user.chat_decoder())
  use message_id <- decode.field("message_id", decode.int)
  use date <- decode.field("date", decode.int)
  use reactions <- decode.field(
    "reactions",
    decode.list(reaction_count_decoder()),
  )
  decode.success(MessageReactionCountUpdated(
    chat:,
    message_id:,
    date:,
    reactions:,
  ))
}

pub type ReactionCount {
  ReactionCount(reaction_type: ReactionType, total_count: Int)
}

pub fn reaction_count_decoder() -> decode.Decoder(ReactionCount) {
  use reaction_type <- decode.field("reaction_type", reaction_type_decoder())
  use total_count <- decode.field("total_count", decode.int)
  decode.success(ReactionCount(reaction_type:, total_count:))
}

pub type MessageReactionUpdated {
  MessageReactionUpdated(
    chat: Chat,
    message_id: Int,
    user: Option(User),
    actor_chat: Option(Chat),
    date: Int,
    old_reactions: List(ReactionType),
    new_reactions: List(ReactionType),
  )
}

pub fn message_reaction_updated_decoder() -> decode.Decoder(
  MessageReactionUpdated,
) {
  use chat <- decode.field("chat", user.chat_decoder())
  use message_id <- decode.field("message_id", decode.int)
  use user <- decode.field("user", decode.optional(user.user_decoder()))
  use actor_chat <- decode.field(
    "actor_chat",
    decode.optional(user.chat_decoder()),
  )
  use date <- decode.field("date", decode.int)
  use old_reactions <- decode.field(
    "old_reactions",
    decode.list(reaction_type_decoder()),
  )
  use new_reactions <- decode.field(
    "new_reactions",
    decode.list(reaction_type_decoder()),
  )
  decode.success(MessageReactionUpdated(
    chat:,
    message_id:,
    user:,
    actor_chat:,
    date:,
    old_reactions:,
    new_reactions:,
  ))
}

pub type ReactionType {
  ReactionTypeEmoji(reaction_type: String, emoji: String)
  ReactionTypeCustomEmoji(reaction_type: String, custom_emoji_id: String)
  ReactionTypePaid(reaction_type: String)
  InvalidReactionType
}

pub fn reaction_type_decoder() -> decode.Decoder(ReactionType) {
  use variant <- decode.field("type", decode.string)
  case variant {
    "reaction_type_emoji" -> {
      use reaction_type <- decode.field("reaction_type", decode.string)
      use emoji <- decode.field("emoji", decode.string)
      decode.success(ReactionTypeEmoji(reaction_type:, emoji:))
    }
    "reaction_type_custom_emoji" -> {
      use reaction_type <- decode.field("reaction_type", decode.string)
      use custom_emoji_id <- decode.field("custom_emoji_id", decode.string)
      decode.success(ReactionTypeCustomEmoji(reaction_type:, custom_emoji_id:))
    }
    "reaction_type_paid" -> {
      use reaction_type <- decode.field("reaction_type", decode.string)
      decode.success(ReactionTypePaid(reaction_type:))
    }
    _ -> decode.failure(InvalidReactionType, "ReactionType")
  }
}

pub type ExternalReplyInfo {
  ExternalReplyInfo(
    origin: MessageOrigin,
    chat: Option(Chat),
    message_id: Option(Int),
    link_preview_options: Option(LinkPreviewOptions),
    animation: Option(Animation),
    audio: Option(Audio),
    document: Option(Document),
    paid_media: Option(PaidMediaInfo),
    photo: Option(List(PhotoSize)),
    sticker: Option(Sticker),
    story: Option(Story),
    video: Option(Video),
    video_note: Option(VideoNote),
    voice: Option(Voice),
    has_media_spoiler: Option(Bool),
    contact: Option(Contact),
    dice: Option(Dice),
    game: Option(Game),
    giveaway: Option(Giveaway),
    giveaway_winners: Option(GiveawayWinners),
    invoice: Option(Invoice),
    location: Option(Location),
    poll: Option(Poll),
    venue: Option(Venue),
  )
}

pub fn external_reply_info_decoder() -> decode.Decoder(ExternalReplyInfo) {
  use origin <- decode.field("origin", message_origin_decoder())
  use chat <- decode.field("chat", decode.optional(user.chat_decoder()))
  use message_id <- decode.field("message_id", decode.optional(decode.int))
  use link_preview_options <- decode.field(
    "link_preview_options",
    decode.optional(link_preview_options_decoder()),
  )
  use animation <- decode.field(
    "animation",
    decode.optional(file.animation_decoder()),
  )
  use audio <- decode.field("audio", decode.optional(file.audio_decoder()))
  use document <- decode.field(
    "document",
    decode.optional(file.document_decoder()),
  )
  use paid_media <- decode.field(
    "paid_media",
    decode.optional(file.paid_media_info_decoder()),
  )
  use photo <- decode.field(
    "photo",
    decode.optional(decode.list(file.photo_size_decoder())),
  )
  use sticker <- decode.field(
    "sticker",
    decode.optional(sticker.sticker_decoder()),
  )
  use story <- decode.field("story", decode.optional(story_decoder()))
  use video <- decode.field("video", decode.optional(file.video_decoder()))
  use video_note <- decode.field(
    "video_note",
    decode.optional(file.video_note_decoder()),
  )
  use voice <- decode.field("voice", decode.optional(file.voice_decoder()))
  use has_media_spoiler <- decode.field(
    "has_media_spoiler",
    decode.optional(decode.bool),
  )
  use contact <- decode.field("contact", decode.optional(contact_decoder()))
  use dice <- decode.field("dice", decode.optional(dice_decoder()))
  use game <- decode.field("game", decode.optional(game_decoder()))
  use giveaway <- decode.field("giveaway", decode.optional(giveaway_decoder()))
  use giveaway_winners <- decode.field(
    "giveaway_winners",
    decode.optional(giveaway_winners_decoder()),
  )
  use invoice <- decode.field("invoice", decode.optional(invoice_decoder()))
  use location <- decode.field("location", decode.optional(location_decoder()))
  use poll <- decode.field("poll", decode.optional(poll_decoder()))
  use venue <- decode.field("venue", decode.optional(venue_decoder()))
  decode.success(ExternalReplyInfo(
    origin:,
    chat:,
    message_id:,
    link_preview_options:,
    animation:,
    audio:,
    document:,
    paid_media:,
    photo:,
    sticker:,
    story:,
    video:,
    video_note:,
    voice:,
    has_media_spoiler:,
    contact:,
    dice:,
    game:,
    giveaway:,
    giveaway_winners:,
    invoice:,
    location:,
    poll:,
    venue:,
  ))
}

pub type VideoChatParticipantsInvited {
  VideoChatParticipantsInvited(users: List(User))
}

pub fn video_chat_participants_invited_decoder() -> decode.Decoder(
  VideoChatParticipantsInvited,
) {
  use users <- decode.field("users", decode.list(user.user_decoder()))
  decode.success(VideoChatParticipantsInvited(users:))
}

pub type VideoChatEnded {
  VideoChatEnded(duration: Int)
}

pub fn video_chat_ended_decoder() -> decode.Decoder(VideoChatEnded) {
  use duration <- decode.field("duration", decode.int)
  decode.success(VideoChatEnded(duration:))
}

pub type VideoChatStarted {
  VideoChatStarted
}

pub fn video_chat_started_decoder() -> decode.Decoder(VideoChatStarted) {
  use variant <- decode.then(decode.string)
  case variant {
    _ -> decode.success(VideoChatStarted)
  }
}

pub type VideoChatScheduled {
  VideoChatScheduled(start_date: Int)
}

pub fn video_chat_scheduled_decoder() -> decode.Decoder(VideoChatScheduled) {
  use start_date <- decode.field("start_date", decode.int)
  decode.success(VideoChatScheduled(start_date:))
}

pub type PaidMessagePriceChanged {
  PaidMessagePriceChanged(paid_message_star_count: Int)
}

pub fn paid_message_price_changed_decoder() -> decode.Decoder(
  PaidMessagePriceChanged,
) {
  use paid_message_star_count <- decode.field(
    "paid_message_star_count",
    decode.int,
  )
  decode.success(PaidMessagePriceChanged(paid_message_star_count:))
}

pub type GeneralForumTopicUnhidden {
  GeneralForumTopicUnhidden
}

pub fn general_forum_topic_unhidden_decoder() -> decode.Decoder(
  GeneralForumTopicUnhidden,
) {
  use variant <- decode.then(decode.string)
  case variant {
    _ -> decode.success(GeneralForumTopicUnhidden)
  }
}

pub type GeneralForumTopicHidden {
  GeneralForumTopicHidden
}

pub fn general_forum_topic_hidden_decoder() -> decode.Decoder(
  GeneralForumTopicHidden,
) {
  use variant <- decode.then(decode.string)
  case variant {
    _ -> decode.success(GeneralForumTopicHidden)
  }
}

pub type ForumTopicReopened {
  ForumTopicReopened
}

pub fn forum_topic_reopened_decoder() -> decode.Decoder(ForumTopicReopened) {
  use variant <- decode.then(decode.string)
  case variant {
    _ -> decode.success(ForumTopicReopened)
  }
}

pub type ForumTopicClosed {
  ForumTopicClosed
}

pub fn forum_topic_closed_decoder() -> decode.Decoder(ForumTopicClosed) {
  use variant <- decode.then(decode.string)
  case variant {
    _ -> decode.success(ForumTopicClosed)
  }
}

pub type ForumTopicEdited {
  ForumTopicEdited(name: Option(String), icon_custom_emoji_id: Option(String))
}

pub fn forum_topic_edited_decoder() -> decode.Decoder(ForumTopicEdited) {
  use name <- decode.field("name", decode.optional(decode.string))
  use icon_custom_emoji_id <- decode.field(
    "icon_custom_emoji_id",
    decode.optional(decode.string),
  )
  decode.success(ForumTopicEdited(name:, icon_custom_emoji_id:))
}

pub type ForumTopicCreated {
  ForumTopicCreated(name: String, icon_color: Int, icon_custom_emoji_id: String)
}

pub fn forum_topic_created_decoder() -> decode.Decoder(ForumTopicCreated) {
  use name <- decode.field("name", decode.string)
  use icon_color <- decode.field("icon_color", decode.int)
  use icon_custom_emoji_id <- decode.field(
    "icon_custom_emoji_id",
    decode.string,
  )
  decode.success(ForumTopicCreated(name:, icon_color:, icon_custom_emoji_id:))
}

pub type ChatBackground {
  ChatBackground(chat_background_type: BackgroundType)
}

pub fn chat_background_decoder() -> decode.Decoder(ChatBackground) {
  use chat_background_type <- decode.field(
    "chat_background_type",
    background_type_decoder(),
  )
  decode.success(ChatBackground(chat_background_type:))
}

pub type BackgroundType {
  BackgroundTypeFill(
    background_type: String,
    fill: BackgroundFill,
    dark_theme_dimming: Int,
  )
  BackgroundTypeWallpaper(
    background_type: String,
    document: Document,
    dark_theme_dimming: Int,
    is_blured: Option(Bool),
    is_moving: Option(Bool),
  )
  BackgroundTypePattern(
    background_type: String,
    document: Document,
    fill: BackgroundFill,
    intensity: Int,
    is_inverted: Option(Bool),
    is_moving: Option(Bool),
  )
  BackgroundTypeChatTheme(background_type: String, theme_name: String)
  InvalidBackgroundType
}

pub fn background_type_decoder() -> decode.Decoder(BackgroundType) {
  use variant <- decode.field("type", decode.string)
  case variant {
    "background_type_fill" -> {
      use background_type <- decode.field("background_type", decode.string)
      use fill <- decode.field("fill", background_fill_decoder())
      use dark_theme_dimming <- decode.field("dark_theme_dimming", decode.int)
      decode.success(BackgroundTypeFill(
        background_type:,
        fill:,
        dark_theme_dimming:,
      ))
    }
    "background_type_wallpaper" -> {
      use background_type <- decode.field("background_type", decode.string)
      use document <- decode.field("document", file.document_decoder())
      use dark_theme_dimming <- decode.field("dark_theme_dimming", decode.int)
      use is_blured <- decode.field("is_blured", decode.optional(decode.bool))
      use is_moving <- decode.field("is_moving", decode.optional(decode.bool))
      decode.success(BackgroundTypeWallpaper(
        background_type:,
        document:,
        dark_theme_dimming:,
        is_blured:,
        is_moving:,
      ))
    }
    "background_type_pattern" -> {
      use background_type <- decode.field("background_type", decode.string)
      use document <- decode.field("document", file.document_decoder())
      use fill <- decode.field("fill", background_fill_decoder())
      use intensity <- decode.field("intensity", decode.int)
      use is_inverted <- decode.field(
        "is_inverted",
        decode.optional(decode.bool),
      )
      use is_moving <- decode.field("is_moving", decode.optional(decode.bool))
      decode.success(BackgroundTypePattern(
        background_type:,
        document:,
        fill:,
        intensity:,
        is_inverted:,
        is_moving:,
      ))
    }
    "background_type_chat_theme" -> {
      use background_type <- decode.field("background_type", decode.string)
      use theme_name <- decode.field("theme_name", decode.string)
      decode.success(BackgroundTypeChatTheme(background_type:, theme_name:))
    }
    _ -> decode.failure(InvalidBackgroundType, "BackgroundType")
  }
}

pub type BackgroundFill {
  BackgroundFillSolid(background_fill_type: String, color: Int)
  BackgroundFillGradient(
    background_fill_type: String,
    top_color: Int,
    bottom_color: Int,
    rotation_angle: Int,
  )
  BackgroundFillFreeformGradient(
    background_fill_type: String,
    colors: List(Int),
  )
  InvalidBackgroundFill
}

pub fn background_fill_decoder() -> decode.Decoder(BackgroundFill) {
  use variant <- decode.field("type", decode.string)
  case variant {
    "background_fill_solid" -> {
      use background_fill_type <- decode.field(
        "background_fill_type",
        decode.string,
      )
      use color <- decode.field("color", decode.int)
      decode.success(BackgroundFillSolid(background_fill_type:, color:))
    }
    "background_fill_gradient" -> {
      use background_fill_type <- decode.field(
        "background_fill_type",
        decode.string,
      )
      use top_color <- decode.field("top_color", decode.int)
      use bottom_color <- decode.field("bottom_color", decode.int)
      use rotation_angle <- decode.field("rotation_angle", decode.int)
      decode.success(BackgroundFillGradient(
        background_fill_type:,
        top_color:,
        bottom_color:,
        rotation_angle:,
      ))
    }
    "background_fill_freeform_gradient" -> {
      use background_fill_type <- decode.field(
        "background_fill_type",
        decode.string,
      )
      use colors <- decode.field("colors", decode.list(decode.int))
      decode.success(BackgroundFillFreeformGradient(
        background_fill_type:,
        colors:,
      ))
    }
    _ -> decode.failure(InvalidBackgroundFill, "BackgroundFill")
  }
}

pub type ChatBoostAdded {
  ChatBoostAdded(boost_count: Int)
}

pub fn chat_boost_added_decoder() -> decode.Decoder(ChatBoostAdded) {
  use boost_count <- decode.field("boost_count", decode.int)
  decode.success(ChatBoostAdded(boost_count:))
}

pub type ProximityAlertTriggered {
  ProximityAlertTriggered(traveler: User, watcher: User, distance: Int)
}

pub fn proximity_alert_triggered_decoder() -> decode.Decoder(
  ProximityAlertTriggered,
) {
  use traveler <- decode.field("traveler", user.user_decoder())
  use watcher <- decode.field("watcher", user.user_decoder())
  use distance <- decode.field("distance", decode.int)
  decode.success(ProximityAlertTriggered(traveler:, watcher:, distance:))
}

pub type PassportData {
  PassportData(
    data: List(EncryptedPassportElement),
    credentials: EncryptedCredentials,
  )
}

pub fn passport_data_decoder() -> decode.Decoder(PassportData) {
  use data <- decode.field(
    "data",
    decode.list(encrypted_passport_element_decoder()),
  )
  use credentials <- decode.field(
    "credentials",
    encrypted_credentials_decoder(),
  )
  decode.success(PassportData(data:, credentials:))
}

pub type EncryptedCredentials {
  EncryptedCredentials(data: String, hash: String, secret: String)
}

pub fn encrypted_credentials_decoder() -> decode.Decoder(EncryptedCredentials) {
  use data <- decode.field("data", decode.string)
  use hash <- decode.field("hash", decode.string)
  use secret <- decode.field("secret", decode.string)
  decode.success(EncryptedCredentials(data:, hash:, secret:))
}

pub type EncryptedPassportElement {
  EncryptedPassportElement(
    encrypted_passport_element_type: String,
    data: String,
    phone_number: Option(String),
    email: Option(String),
    files: Option(List(PassportFile)),
    front_side: Option(PassportFile),
    reverse_side: Option(PassportFile),
    selfie: Option(PassportFile),
    translation: Option(List(PassportFile)),
    hash: String,
  )
}

pub fn encrypted_passport_element_decoder() -> decode.Decoder(
  EncryptedPassportElement,
) {
  use encrypted_passport_element_type <- decode.field(
    "encrypted_passport_element_type",
    decode.string,
  )
  use data <- decode.field("data", decode.string)
  use phone_number <- decode.field(
    "phone_number",
    decode.optional(decode.string),
  )
  use email <- decode.field("email", decode.optional(decode.string))
  use files <- decode.field(
    "files",
    decode.optional(decode.list(passport_file_decoder())),
  )
  use front_side <- decode.field(
    "front_side",
    decode.optional(passport_file_decoder()),
  )
  use reverse_side <- decode.field(
    "reverse_side",
    decode.optional(passport_file_decoder()),
  )
  use selfie <- decode.field("selfie", decode.optional(passport_file_decoder()))
  use translation <- decode.field(
    "translation",
    decode.optional(decode.list(passport_file_decoder())),
  )
  use hash <- decode.field("hash", decode.string)
  decode.success(EncryptedPassportElement(
    encrypted_passport_element_type:,
    data:,
    phone_number:,
    email:,
    files:,
    front_side:,
    reverse_side:,
    selfie:,
    translation:,
    hash:,
  ))
}

pub type PassportFile {
  PassportFile(
    file_id: String,
    file_unique_id: String,
    file_size: Int,
    file_date: Int,
  )
}

pub fn passport_file_decoder() -> decode.Decoder(PassportFile) {
  use file_id <- decode.field("file_id", decode.string)
  use file_unique_id <- decode.field("file_unique_id", decode.string)
  use file_size <- decode.field("file_size", decode.int)
  use file_date <- decode.field("file_date", decode.int)
  decode.success(PassportFile(file_id:, file_unique_id:, file_size:, file_date:))
}

pub type WriteAccessAllowed {
  WriteAccessAllowed(
    from_request: Option(Bool),
    web_app_name: Option(String),
    from_attachment_menu: Option(Bool),
  )
}

pub fn write_access_allowed_decoder() -> decode.Decoder(WriteAccessAllowed) {
  use from_request <- decode.field("from_request", decode.optional(decode.bool))
  use web_app_name <- decode.field(
    "web_app_name",
    decode.optional(decode.string),
  )
  use from_attachment_menu <- decode.field(
    "from_attachment_menu",
    decode.optional(decode.bool),
  )
  decode.success(WriteAccessAllowed(
    from_request:,
    web_app_name:,
    from_attachment_menu:,
  ))
}

pub type ChatShared {
  ChatShared(
    request_id: Int,
    chat_id: Int,
    title: Option(String),
    username: Option(String),
    photo: Option(List(PhotoSize)),
  )
}

pub fn chat_shared_decoder() -> decode.Decoder(ChatShared) {
  use request_id <- decode.field("request_id", decode.int)
  use chat_id <- decode.field("chat_id", decode.int)
  use title <- decode.field("title", decode.optional(decode.string))
  use username <- decode.field("username", decode.optional(decode.string))
  use photo <- decode.field(
    "photo",
    decode.optional(decode.list(file.photo_size_decoder())),
  )
  decode.success(ChatShared(request_id:, chat_id:, title:, username:, photo:))
}

pub type UsersShared {
  UsersShared(request_id: Int, users: List(SharedUser))
}

pub fn users_shared_decoder() -> decode.Decoder(UsersShared) {
  use request_id <- decode.field("request_id", decode.int)
  use users <- decode.field("users", decode.list(shared_user_decoder()))
  decode.success(UsersShared(request_id:, users:))
}

pub type SharedUser {
  SharedUser(
    user_id: Int,
    first_name: Option(String),
    last_name: Option(String),
    username: Option(String),
    photo: Option(List(PhotoSize)),
  )
}

pub fn shared_user_decoder() -> decode.Decoder(SharedUser) {
  use user_id <- decode.field("user_id", decode.int)
  use first_name <- decode.field("first_name", decode.optional(decode.string))
  use last_name <- decode.field("last_name", decode.optional(decode.string))
  use username <- decode.field("username", decode.optional(decode.string))
  use photo <- decode.field(
    "photo",
    decode.optional(decode.list(file.photo_size_decoder())),
  )
  decode.success(SharedUser(
    user_id:,
    first_name:,
    last_name:,
    username:,
    photo:,
  ))
}

pub type RefundedPayment {
  RefundedPayment(
    currency: String,
    total_amount: Int,
    invoice_payload: String,
    telegram_payment_charge_id: String,
    provider_payment_charge_id: Option(String),
  )
}

pub fn refunded_payment_decoder() -> decode.Decoder(RefundedPayment) {
  use currency <- decode.field("currency", decode.string)
  use total_amount <- decode.field("total_amount", decode.int)
  use invoice_payload <- decode.field("invoice_payload", decode.string)
  use telegram_payment_charge_id <- decode.field(
    "telegram_payment_charge_id",
    decode.string,
  )
  use provider_payment_charge_id <- decode.field(
    "provider_payment_charge_id",
    decode.optional(decode.string),
  )
  decode.success(RefundedPayment(
    currency:,
    total_amount:,
    invoice_payload:,
    telegram_payment_charge_id:,
    provider_payment_charge_id:,
  ))
}

pub type SuccessfulPayment {
  SuccessfulPayment(
    currency: String,
    total_amount: Int,
    invoice_payload: String,
    subscription_expiration_date: Option(Int),
    is_recurring: Option(Bool),
    is_first_recurring: Option(Bool),
    shipping_option_id: Option(String),
    order_info: Option(OrderInfo),
    telegram_payment_charge_id: String,
    provider_payment_charge_id: String,
  )
}

pub fn successful_payment_decoder() -> decode.Decoder(SuccessfulPayment) {
  use currency <- decode.field("currency", decode.string)
  use total_amount <- decode.field("total_amount", decode.int)
  use invoice_payload <- decode.field("invoice_payload", decode.string)
  use subscription_expiration_date <- decode.field(
    "subscription_expiration_date",
    decode.optional(decode.int),
  )
  use is_recurring <- decode.field("is_recurring", decode.optional(decode.bool))
  use is_first_recurring <- decode.field(
    "is_first_recurring",
    decode.optional(decode.bool),
  )
  use shipping_option_id <- decode.field(
    "shipping_option_id",
    decode.optional(decode.string),
  )
  use order_info <- decode.field(
    "order_info",
    decode.optional(order_info_decoder()),
  )
  use telegram_payment_charge_id <- decode.field(
    "telegram_payment_charge_id",
    decode.string,
  )
  use provider_payment_charge_id <- decode.field(
    "provider_payment_charge_id",
    decode.string,
  )
  decode.success(SuccessfulPayment(
    currency:,
    total_amount:,
    invoice_payload:,
    subscription_expiration_date:,
    is_recurring:,
    is_first_recurring:,
    shipping_option_id:,
    order_info:,
    telegram_payment_charge_id:,
    provider_payment_charge_id:,
  ))
}

pub type OrderInfo {
  OrderInfo(
    name: Option(String),
    phone_number: Option(String),
    email: Option(String),
    shipping_address: Option(ShippingAddress),
  )
}

pub fn order_info_decoder() -> decode.Decoder(OrderInfo) {
  use name <- decode.field("name", decode.optional(decode.string))
  use phone_number <- decode.field(
    "phone_number",
    decode.optional(decode.string),
  )
  use email <- decode.field("email", decode.optional(decode.string))
  use shipping_address <- decode.field(
    "shipping_address",
    decode.optional(shipping_address_decoder()),
  )
  decode.success(OrderInfo(name:, phone_number:, email:, shipping_address:))
}

pub type ShippingAddress {
  ShippingAddress(
    country_code: String,
    state: String,
    city: String,
    street_line1: String,
    street_line2: String,
    post_code: String,
  )
}

pub fn shipping_address_decoder() -> decode.Decoder(ShippingAddress) {
  use country_code <- decode.field("country_code", decode.string)
  use state <- decode.field("state", decode.string)
  use city <- decode.field("city", decode.string)
  use street_line1 <- decode.field("street_line1", decode.string)
  use street_line2 <- decode.field("street_line2", decode.string)
  use post_code <- decode.field("post_code", decode.string)
  decode.success(ShippingAddress(
    country_code:,
    state:,
    city:,
    street_line1:,
    street_line2:,
    post_code:,
  ))
}

pub type Invoice {
  Invoice(
    title: String,
    description: String,
    start_parameter: String,
    currency: String,
    total_amount: Int,
  )
}

pub fn invoice_decoder() -> decode.Decoder(Invoice) {
  use title <- decode.field("title", decode.string)
  use description <- decode.field("description", decode.string)
  use start_parameter <- decode.field("start_parameter", decode.string)
  use currency <- decode.field("currency", decode.string)
  use total_amount <- decode.field("total_amount", decode.int)
  decode.success(Invoice(
    title:,
    description:,
    start_parameter:,
    currency:,
    total_amount:,
  ))
}

pub type MaybeInaccessibleMessage {
  MaybeInaccessibleMessage(
    maybe_inaccesseble_message_type: String,
    offset: Int,
    length: Int,
    url: Option(String),
    user: Option(User),
    language: Option(String),
    custom_emoji_id: Option(String),
  )
}

pub fn maybe_inaccessible_message_decoder() -> decode.Decoder(
  MaybeInaccessibleMessage,
) {
  use maybe_inaccesseble_message_type <- decode.field(
    "maybe_inaccesseble_message_type",
    decode.string,
  )
  use offset <- decode.field("offset", decode.int)
  use length <- decode.field("length", decode.int)
  use url <- decode.field("url", decode.optional(decode.string))
  use user <- decode.field("user", decode.optional(user.user_decoder()))
  use language <- decode.field("language", decode.optional(decode.string))
  use custom_emoji_id <- decode.field(
    "custom_emoji_id",
    decode.optional(decode.string),
  )
  decode.success(MaybeInaccessibleMessage(
    maybe_inaccesseble_message_type:,
    offset:,
    length:,
    url:,
    user:,
    language:,
    custom_emoji_id:,
  ))
}

pub type MessageAutoDeleteTimerChanged {
  MessageAutoDeleteTimerChanged(message_auto_delete_time: Int)
}

pub fn message_auto_delete_timer_changed_decoder() -> decode.Decoder(
  MessageAutoDeleteTimerChanged,
) {
  use message_auto_delete_time <- decode.field(
    "message_auto_delete_time",
    decode.int,
  )
  decode.success(MessageAutoDeleteTimerChanged(message_auto_delete_time:))
}

pub type Venue {
  Venue(
    location: Location,
    title: String,
    address: String,
    foursquare_id: Option(String),
    foursquare_type: Option(String),
    google_place_id: Option(String),
    google_place_type: Option(String),
  )
}

pub fn venue_decoder() -> decode.Decoder(Venue) {
  use location <- decode.field("location", location_decoder())
  use title <- decode.field("title", decode.string)
  use address <- decode.field("address", decode.string)
  use foursquare_id <- decode.field(
    "foursquare_id",
    decode.optional(decode.string),
  )
  use foursquare_type <- decode.field(
    "foursquare_type",
    decode.optional(decode.string),
  )
  use google_place_id <- decode.field(
    "google_place_id",
    decode.optional(decode.string),
  )
  use google_place_type <- decode.field(
    "google_place_type",
    decode.optional(decode.string),
  )
  decode.success(Venue(
    location:,
    title:,
    address:,
    foursquare_id:,
    foursquare_type:,
    google_place_id:,
    google_place_type:,
  ))
}

pub type Location {
  Location(
    latitude: Float,
    longitude: Float,
    horizontal_accuracy: Option(Float),
    live_period: Option(Int),
    heading: Option(Int),
    proximity_alert_radius: Option(Int),
  )
}

pub fn location_decoder() -> decode.Decoder(Location) {
  use latitude <- decode.field("latitude", decode.float)
  use longitude <- decode.field("longitude", decode.float)
  use horizontal_accuracy <- decode.field(
    "horizontal_accuracy",
    decode.optional(decode.float),
  )
  use live_period <- decode.field("live_period", decode.optional(decode.int))
  use heading <- decode.field("heading", decode.optional(decode.int))
  use proximity_alert_radius <- decode.field(
    "proximity_alert_radius",
    decode.optional(decode.int),
  )
  decode.success(Location(
    latitude:,
    longitude:,
    horizontal_accuracy:,
    live_period:,
    heading:,
    proximity_alert_radius:,
  ))
}

pub type Poll {
  Poll(
    id: String,
    question: String,
    question_entities: Option(List(MessageEntity)),
    options: List(PollOption),
    total_voter_count: Int,
    is_closed: Bool,
    is_anonymous: Bool,
    poll_type: String,
    allows_multiple_answers: Bool,
    correct_option_id: Option(Int),
    explanation: Option(String),
    explanation_entities: Option(List(MessageEntity)),
    open_period: Option(Int),
    close_date: Option(Int),
  )
}

pub fn poll_decoder() -> decode.Decoder(Poll) {
  use id <- decode.field("id", decode.string)
  use question <- decode.field("question", decode.string)
  use question_entities <- decode.field(
    "question_entities",
    decode.optional(decode.list(message_entity_decoder())),
  )
  use options <- decode.field("options", decode.list(poll_option_decoder()))
  use total_voter_count <- decode.field("total_voter_count", decode.int)
  use is_closed <- decode.field("is_closed", decode.bool)
  use is_anonymous <- decode.field("is_anonymous", decode.bool)
  use poll_type <- decode.field("poll_type", decode.string)
  use allows_multiple_answers <- decode.field(
    "allows_multiple_answers",
    decode.bool,
  )
  use correct_option_id <- decode.field(
    "correct_option_id",
    decode.optional(decode.int),
  )
  use explanation <- decode.field("explanation", decode.optional(decode.string))
  use explanation_entities <- decode.field(
    "explanation_entities",
    decode.optional(decode.list(message_entity_decoder())),
  )
  use open_period <- decode.field("open_period", decode.optional(decode.int))
  use close_date <- decode.field("close_date", decode.optional(decode.int))
  decode.success(Poll(
    id:,
    question:,
    question_entities:,
    options:,
    total_voter_count:,
    is_closed:,
    is_anonymous:,
    poll_type:,
    allows_multiple_answers:,
    correct_option_id:,
    explanation:,
    explanation_entities:,
    open_period:,
    close_date:,
  ))
}

pub type PollOption {
  PollOption(
    text: String,
    text_entities: Option(List(MessageEntity)),
    voter_count: Int,
  )
}

pub fn poll_option_decoder() -> decode.Decoder(PollOption) {
  use text <- decode.field("text", decode.string)
  use text_entities <- decode.field(
    "text_entities",
    decode.optional(decode.list(message_entity_decoder())),
  )
  use voter_count <- decode.field("voter_count", decode.int)
  decode.success(PollOption(text:, text_entities:, voter_count:))
}

pub type PollAnswer {
  PollAnswer(
    poll_id: String,
    voter_chat: Option(Chat),
    user: Option(User),
    option_ids: List(Int),
  )
}

pub fn poll_answer_decoder() -> decode.Decoder(PollAnswer) {
  use poll_id <- decode.field("poll_id", decode.string)
  use voter_chat <- decode.field(
    "voter_chat",
    decode.optional(user.chat_decoder()),
  )
  use user <- decode.field("user", decode.optional(user.user_decoder()))
  use option_ids <- decode.field("option_ids", decode.list(decode.int))
  decode.success(PollAnswer(poll_id:, voter_chat:, user:, option_ids:))
}

pub type Game {
  Game(
    title: String,
    description: String,
    photo: List(PhotoSize),
    text: Option(String),
    text_entities: Option(List(MessageEntity)),
    animation: Option(Animation),
  )
}

pub fn game_decoder() -> decode.Decoder(Game) {
  use title <- decode.field("title", decode.string)
  use description <- decode.field("description", decode.string)
  use photo <- decode.field("photo", decode.list(file.photo_size_decoder()))
  use text <- decode.field("text", decode.optional(decode.string))
  use text_entities <- decode.field(
    "text_entities",
    decode.optional(decode.list(message_entity_decoder())),
  )
  use animation <- decode.field(
    "animation",
    decode.optional(file.animation_decoder()),
  )
  decode.success(Game(
    title:,
    description:,
    photo:,
    text:,
    text_entities:,
    animation:,
  ))
}

pub type Dice {
  Dice(emoji: String, value: Int)
}

pub fn dice_decoder() -> decode.Decoder(Dice) {
  use emoji <- decode.field("emoji", decode.string)
  use value <- decode.field("value", decode.int)
  decode.success(Dice(emoji:, value:))
}

pub type Contact {
  Contact(
    phone_number: String,
    first_name: String,
    last_name: Option(String),
    user_id: Option(Int),
    vcard: Option(String),
  )
}

pub fn contact_decoder() -> decode.Decoder(Contact) {
  use phone_number <- decode.field("phone_number", decode.string)
  use first_name <- decode.field("first_name", decode.string)
  use last_name <- decode.field("last_name", decode.optional(decode.string))
  use user_id <- decode.field("user_id", decode.optional(decode.int))
  use vcard <- decode.field("vcard", decode.optional(decode.string))
  decode.success(Contact(
    phone_number:,
    first_name:,
    last_name:,
    user_id:,
    vcard:,
  ))
}

pub type LinkPreviewOptions {
  LinkPreviewOptions(
    is_disabled: Option(Bool),
    url: Option(String),
    prefer_smal_media: Option(Bool),
    prefer_large_media: Option(Bool),
    show_above_text: Option(Bool),
  )
}

pub fn link_preview_options_decoder() -> decode.Decoder(LinkPreviewOptions) {
  use is_disabled <- decode.field("is_disabled", decode.optional(decode.bool))
  use url <- decode.field("url", decode.optional(decode.string))
  use prefer_smal_media <- decode.field(
    "prefer_smal_media",
    decode.optional(decode.bool),
  )
  use prefer_large_media <- decode.field(
    "prefer_large_media",
    decode.optional(decode.bool),
  )
  use show_above_text <- decode.field(
    "show_above_text",
    decode.optional(decode.bool),
  )
  decode.success(LinkPreviewOptions(
    is_disabled:,
    url:,
    prefer_smal_media:,
    prefer_large_media:,
    show_above_text:,
  ))
}

pub type Story {
  Story(chat: Chat, id: Int)
}

pub fn story_decoder() -> decode.Decoder(Story) {
  use chat <- decode.field("chat", user.chat_decoder())
  use id <- decode.field("id", decode.int)
  decode.success(Story(chat:, id:))
}

pub type TextQuote {
  TextQuote(
    text: String,
    entities: Option(List(MessageEntity)),
    position: Int,
    is_manual: Option(Bool),
  )
}

pub fn text_quote_decoder() -> decode.Decoder(TextQuote) {
  use text <- decode.field("text", decode.string)
  use entities <- decode.field(
    "entities",
    decode.optional(decode.list(message_entity_decoder())),
  )
  use position <- decode.field("position", decode.int)
  use is_manual <- decode.field("is_manual", decode.optional(decode.bool))
  decode.success(TextQuote(text:, entities:, position:, is_manual:))
}

pub type MessageEntity {
  MessageEntity(
    message_entity_type: String,
    offset: Int,
    length: Int,
    url: String,
    user: User,
    language: String,
    custom_emoji_id: String,
  )
}

pub fn message_entity_decoder() -> decode.Decoder(MessageEntity) {
  use message_entity_type <- decode.field("message_entity_type", decode.string)
  use offset <- decode.field("offset", decode.int)
  use length <- decode.field("length", decode.int)
  use url <- decode.field("url", decode.string)
  use user <- decode.field("user", user.user_decoder())
  use language <- decode.field("language", decode.string)
  use custom_emoji_id <- decode.field("custom_emoji_id", decode.string)
  decode.success(MessageEntity(
    message_entity_type:,
    offset:,
    length:,
    url:,
    user:,
    language:,
    custom_emoji_id:,
  ))
}

pub type MessageOrigin {
  MessageOriginUser(message_origin_type: String, date: Int, sender_user: User)
  MessageOriginHiddenUser(
    message_origin_type: String,
    date: Int,
    sender_user_name: String,
  )
  MessageOriginChat(
    message_origin_type: String,
    date: Int,
    sender_chat: Chat,
    author_signature: Option(String),
  )
  MessageOriginChannel(
    message_origin_type: String,
    date: Int,
    chat: Chat,
    message_id: String,
    author_signature: Option(String),
  )
  InvalidMessageOrigin
}

pub fn message_origin_decoder() -> decode.Decoder(MessageOrigin) {
  use variant <- decode.field("type", decode.string)
  case variant {
    "message_origin_user" -> {
      use message_origin_type <- decode.field(
        "message_origin_type",
        decode.string,
      )
      use date <- decode.field("date", decode.int)
      use sender_user <- decode.field("sender_user", user.user_decoder())
      decode.success(MessageOriginUser(
        message_origin_type:,
        date:,
        sender_user:,
      ))
    }
    "message_origin_hidden_user" -> {
      use message_origin_type <- decode.field(
        "message_origin_type",
        decode.string,
      )
      use date <- decode.field("date", decode.int)
      use sender_user_name <- decode.field("sender_user_name", decode.string)
      decode.success(MessageOriginHiddenUser(
        message_origin_type:,
        date:,
        sender_user_name:,
      ))
    }
    "message_origin_chat" -> {
      use message_origin_type <- decode.field(
        "message_origin_type",
        decode.string,
      )
      use date <- decode.field("date", decode.int)
      use sender_chat <- decode.field("sender_chat", user.chat_decoder())
      use author_signature <- decode.field(
        "author_signature",
        decode.optional(decode.string),
      )
      decode.success(MessageOriginChat(
        message_origin_type:,
        date:,
        sender_chat:,
        author_signature:,
      ))
    }
    "message_origin_channel" -> {
      use message_origin_type <- decode.field(
        "message_origin_type",
        decode.string,
      )
      use date <- decode.field("date", decode.int)
      use chat <- decode.field("chat", user.chat_decoder())
      use message_id <- decode.field("message_id", decode.string)
      use author_signature <- decode.field(
        "author_signature",
        decode.optional(decode.string),
      )
      decode.success(MessageOriginChannel(
        message_origin_type:,
        date:,
        chat:,
        message_id:,
        author_signature:,
      ))
    }
    _ -> decode.failure(InvalidMessageOrigin, "MessageOrigin")
  }
}

pub type UniqueGiftInfo {
  UniqueGiftInfo(
    gift: UniqueGift,
    origin: String,
    owned_gift_id: Option(String),
    transfer_star_count: Option(Int),
  )
}

pub fn unique_gift_info_decoder() -> decode.Decoder(UniqueGiftInfo) {
  use gift <- decode.field("gift", unique_gift_decoder())
  use origin <- decode.field("origin", decode.string)
  use owned_gift_id <- decode.field(
    "owned_gift_id",
    decode.optional(decode.string),
  )
  use transfer_star_count <- decode.field(
    "transfer_star_count",
    decode.optional(decode.int),
  )
  decode.success(UniqueGiftInfo(
    gift:,
    origin:,
    owned_gift_id:,
    transfer_star_count:,
  ))
}

pub type UniqueGift {
  UniqueGift(
    base_name: String,
    name: String,
    number: Int,
    model: UniqueGiftModel,
    symbol: UniqueGiftSymbol,
    backdrop: UniqueGiftBackdrop,
  )
}

pub fn unique_gift_decoder() -> decode.Decoder(UniqueGift) {
  use base_name <- decode.field("base_name", decode.string)
  use name <- decode.field("name", decode.string)
  use number <- decode.field("number", decode.int)
  use model <- decode.field("model", unique_gift_model_decoder())
  use symbol <- decode.field("symbol", unique_gift_symbol_decoder())
  use backdrop <- decode.field("backdrop", unique_gift_backdrop_decoder())
  decode.success(UniqueGift(
    base_name:,
    name:,
    number:,
    model:,
    symbol:,
    backdrop:,
  ))
}

pub type UniqueGiftModel {
  UniqueGiftModel(name: String, sticker: Sticker, rarity_per_mille: Int)
}

pub fn unique_gift_model_decoder() -> decode.Decoder(UniqueGiftModel) {
  use name <- decode.field("name", decode.string)
  use sticker <- decode.field("sticker", sticker.sticker_decoder())
  use rarity_per_mille <- decode.field("rarity_per_mille", decode.int)
  decode.success(UniqueGiftModel(name:, sticker:, rarity_per_mille:))
}

pub type UniqueGiftSymbol {
  UniqueGiftSymbol(name: String, sticker: Sticker, rarity_per_mille: Int)
}

pub fn unique_gift_symbol_decoder() -> decode.Decoder(UniqueGiftSymbol) {
  use name <- decode.field("name", decode.string)
  use sticker <- decode.field("sticker", sticker.sticker_decoder())
  use rarity_per_mille <- decode.field("rarity_per_mille", decode.int)
  decode.success(UniqueGiftSymbol(name:, sticker:, rarity_per_mille:))
}

pub type UniqueGiftBackdrop {
  UniqueGiftBackdrop(
    name: String,
    colors: UniqueGiftBackdropColors,
    rarity_per_mille: Int,
  )
}

pub fn unique_gift_backdrop_decoder() -> decode.Decoder(UniqueGiftBackdrop) {
  use name <- decode.field("name", decode.string)
  use colors <- decode.field("colors", unique_gift_backdrop_colors_decoder())
  use rarity_per_mille <- decode.field("rarity_per_mille", decode.int)
  decode.success(UniqueGiftBackdrop(name:, colors:, rarity_per_mille:))
}

pub type UniqueGiftBackdropColors {
  UniqueGiftBackdropColors(
    center_color: Int,
    edge_color: Int,
    symbol_color: Int,
    text_color: Int,
  )
}

pub fn unique_gift_backdrop_colors_decoder() -> decode.Decoder(
  UniqueGiftBackdropColors,
) {
  use center_color <- decode.field("center_color", decode.int)
  use edge_color <- decode.field("edge_color", decode.int)
  use symbol_color <- decode.field("symbol_color", decode.int)
  use text_color <- decode.field("text_color", decode.int)
  decode.success(UniqueGiftBackdropColors(
    center_color:,
    edge_color:,
    symbol_color:,
    text_color:,
  ))
}

pub type GiftInfo {
  GiftInfo(
    gift: Gift,
    owned_gift_id: Option(String),
    convert_star_count: Option(Int),
    prepaid_upgrade_star_count: Option(Int),
    can_be_upgraded: Option(Bool),
    text: Option(String),
    entities: Option(List(MessageEntity)),
    is_private: Option(Bool),
  )
}

pub fn gift_info_decoder() -> decode.Decoder(GiftInfo) {
  use gift <- decode.field("gift", gift_decoder())
  use owned_gift_id <- decode.field(
    "owned_gift_id",
    decode.optional(decode.string),
  )
  use convert_star_count <- decode.field(
    "convert_star_count",
    decode.optional(decode.int),
  )
  use prepaid_upgrade_star_count <- decode.field(
    "prepaid_upgrade_star_count",
    decode.optional(decode.int),
  )
  use can_be_upgraded <- decode.field(
    "can_be_upgraded",
    decode.optional(decode.bool),
  )
  use text <- decode.field("text", decode.optional(decode.string))
  use entities <- decode.field(
    "entities",
    decode.optional(decode.list(message_entity_decoder())),
  )
  use is_private <- decode.field("is_private", decode.optional(decode.bool))
  decode.success(GiftInfo(
    gift:,
    owned_gift_id:,
    convert_star_count:,
    prepaid_upgrade_star_count:,
    can_be_upgraded:,
    text:,
    entities:,
    is_private:,
  ))
}

pub type Gift {
  Gift(
    id: String,
    sticker: Sticker,
    star_count: Int,
    upgrade_star_count: Option(Int),
    total_count: Option(Int),
    remaining_count: Option(Int),
  )
}

pub fn gift_decoder() -> decode.Decoder(Gift) {
  use id <- decode.field("id", decode.string)
  use sticker <- decode.field("sticker", sticker.sticker_decoder())
  use star_count <- decode.field("star_count", decode.int)
  use upgrade_star_count <- decode.field(
    "upgrade_star_count",
    decode.optional(decode.int),
  )
  use total_count <- decode.field("total_count", decode.optional(decode.int))
  use remaining_count <- decode.field(
    "remaining_count",
    decode.optional(decode.int),
  )
  decode.success(Gift(
    id:,
    sticker:,
    star_count:,
    upgrade_star_count:,
    total_count:,
    remaining_count:,
  ))
}

pub type GiveawayCompleted {
  GiveawayCompleted(
    winner_count: Int,
    unclaimed_prize_count: Option(Int),
    giveaway_message: Option(Message),
    is_star_giveaway: Option(Bool),
  )
}

pub fn giveaway_completed_decoder() -> decode.Decoder(GiveawayCompleted) {
  use winner_count <- decode.field("winner_count", decode.int)
  use unclaimed_prize_count <- decode.field(
    "unclaimed_prize_count",
    decode.optional(decode.int),
  )
  use giveaway_message <- decode.field(
    "giveaway_message",
    decode.optional(message_decoder()),
  )
  use is_star_giveaway <- decode.field(
    "is_star_giveaway",
    decode.optional(decode.bool),
  )
  decode.success(GiveawayCompleted(
    winner_count:,
    unclaimed_prize_count:,
    giveaway_message:,
    is_star_giveaway:,
  ))
}

pub type GiveawayWinners {
  GiveawayWinners(
    chat: Chat,
    giveaway_message_id: Int,
    winners_selection_date: Int,
    winner_count: Int,
    winners: List(User),
    additional_chat_count: Option(Int),
    prize_star_count: Option(Int),
    premium_subscription_month_count: Option(Int),
    unclaimed_prize_count: Option(Int),
    only_new_members: Option(Bool),
    was_refunded: Option(Bool),
    prize_description: Option(String),
  )
}

pub fn giveaway_winners_decoder() -> decode.Decoder(GiveawayWinners) {
  use chat <- decode.field("chat", user.chat_decoder())
  use giveaway_message_id <- decode.field("giveaway_message_id", decode.int)
  use winners_selection_date <- decode.field(
    "winners_selection_date",
    decode.int,
  )
  use winner_count <- decode.field("winner_count", decode.int)
  use winners <- decode.field("winners", decode.list(user.user_decoder()))
  use additional_chat_count <- decode.field(
    "additional_chat_count",
    decode.optional(decode.int),
  )
  use prize_star_count <- decode.field(
    "prize_star_count",
    decode.optional(decode.int),
  )
  use premium_subscription_month_count <- decode.field(
    "premium_subscription_month_count",
    decode.optional(decode.int),
  )
  use unclaimed_prize_count <- decode.field(
    "unclaimed_prize_count",
    decode.optional(decode.int),
  )
  use only_new_members <- decode.field(
    "only_new_members",
    decode.optional(decode.bool),
  )
  use was_refunded <- decode.field("was_refunded", decode.optional(decode.bool))
  use prize_description <- decode.field(
    "prize_description",
    decode.optional(decode.string),
  )
  decode.success(GiveawayWinners(
    chat:,
    giveaway_message_id:,
    winners_selection_date:,
    winner_count:,
    winners:,
    additional_chat_count:,
    prize_star_count:,
    premium_subscription_month_count:,
    unclaimed_prize_count:,
    only_new_members:,
    was_refunded:,
    prize_description:,
  ))
}

pub type Giveaway {
  Giveaway(
    chats: List(Chat),
    winners_selection_date: Int,
    winner_count: Int,
    only_new_members: Option(Bool),
    has_public_winners: Option(Bool),
    prize_description: Option(String),
    country_codes: Option(List(String)),
    prize_star_count: Option(Int),
    premium_subscription_month_count: Option(Int),
  )
}

pub fn giveaway_decoder() -> decode.Decoder(Giveaway) {
  use chats <- decode.field("chats", decode.list(user.chat_decoder()))
  use winners_selection_date <- decode.field(
    "winners_selection_date",
    decode.int,
  )
  use winner_count <- decode.field("winner_count", decode.int)
  use only_new_members <- decode.field(
    "only_new_members",
    decode.optional(decode.bool),
  )
  use has_public_winners <- decode.field(
    "has_public_winners",
    decode.optional(decode.bool),
  )
  use prize_description <- decode.field(
    "prize_description",
    decode.optional(decode.string),
  )
  use country_codes <- decode.field(
    "country_codes",
    decode.optional(decode.list(decode.string)),
  )
  use prize_star_count <- decode.field(
    "prize_star_count",
    decode.optional(decode.int),
  )
  use premium_subscription_month_count <- decode.field(
    "premium_subscription_month_count",
    decode.optional(decode.int),
  )
  decode.success(Giveaway(
    chats:,
    winners_selection_date:,
    winner_count:,
    only_new_members:,
    has_public_winners:,
    prize_description:,
    country_codes:,
    prize_star_count:,
    premium_subscription_month_count:,
  ))
}

pub type GiveawayCreated {
  GiveawayCreated(prize_star_count: Option(Int))
}

pub fn giveaway_created_decoder() -> decode.Decoder(GiveawayCreated) {
  use prize_star_count <- decode.field(
    "prize_star_count",
    decode.optional(decode.int),
  )
  decode.success(GiveawayCreated(prize_star_count:))
}
