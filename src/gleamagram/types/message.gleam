import gleam/option.{type Option}
import gleamagram/types/file.{
  type Animation, type Audio, type Document, type PaidMediaInfo, type PhotoSize,
  type Video, type VideoNote, type Voice,
}
import gleamagram/types/giveaway.{
  type GiveawayCompleted, type GiveawayCreated, type GiveawayWinners,
    type Giveaway,
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

pub type MessageReactionCountUpdated {
  MessageReactionCountUpdated(
    chat: Chat,
    message_id: Int,
    date: Int,
    reactions: List(ReactionCount),
  )
}

pub type ReactionCount {
  ReactionCount(reaction_type: ReactionType, total_count: Int)
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

pub type ReactionType {
  ReactionTypeEmoji(reaction_type: String, emoji: String)
  ReactionTypeCustomEmoji(reaction_type: String, custom_emoji_id: String)
  ReactionTypePaid(reaction_type: String)
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

pub type VideoChatParticipantsInvited {
  VideoChatParticipantsInvited(users: List(User))
}

pub type VideoChatEnded {
  VideoChatEnded(duration: Int)
}

pub type VideoChatStarted {
  VideoChatStarted
}

pub type VideoChatScheduled {
  VideoChatScheduled(start_date: Int)
}

pub type PaidMessagePriceChanged {
  PaidMessagePriceChanged(paid_message_star_count: Int)
}

pub type GeneralForumTopicUnhidden {
  GeneralForumTopicUnhidden
}

pub type GeneralForumTopicHidden {
  GeneralForumTopicHidden
}

pub type ForumTopicReopened {
  ForumTopicReopened
}

pub type ForumTopicClosed {
  ForumTopicClosed
}

pub type ForumTopicEdited {
  ForumTopicEdited(name: Option(String), icon_custom_emoji_id: Option(String))
}

pub type ForumTopicCreated {
  ForumTopicCreated(name: String, icon_color: Int, icon_custom_emoji_id: String)
}

pub type ChatBackground {
  ChatBackground(chat_background_type: BackgroundType)
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
}

pub type ChatBoostAdded {
  ChatBoostAdded(boost_count: Int)
}

pub type ProximityAlertTriggered {
  ProximityAlertTriggered(traveler: User, watcher: User, distance: Int)
}

pub type PassportData {
  PassportData(
    data: List(EncryptedPassportElement),
    credentials: EncryptedCredentials,
  )
}

pub type EncryptedCredentials {
  EncryptedCredentials(data: String, hash: String, secret: String)
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

pub type PassportFile {
  PassportFile(
    file_id: String,
    file_unique_id: String,
    file_size: Int,
    file_date: Int,
  )
}

pub type WriteAccessAllowed {
  WriteAccessAllowed(
    from_request: Option(Bool),
    web_app_name: Option(String),
    from_attachment_menu: Option(Bool),
  )
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

pub type UsersShared {
  UsersShared(request_id: Int, users: List(SharedUser))
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

pub type RefundedPayment {
  RefundedPayment(
    currency: String,
    total_amount: Int,
    invoice_payload: String,
    telegram_payment_charge_id: String,
    provider_payment_charge_id: Option(String),
  )
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

pub type OrderInfo {
  OrderInfo(
    name: Option(String),
    phone_number: Option(String),
    email: Option(String),
    shipping_address: Option(ShippingAddress),
  )
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

pub type Invoice {
  Invoice(
    title: String,
    description: String,
    start_parameter: String,
    currency: String,
    total_amount: Int,
  )
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

pub type MessageAutoDeleteTimerChanged {
  MessageAutoDeleteTimerChanged(message_auto_delete_time: Int)
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

pub type PollOption {
  PollOption(
    text: String,
    text_entities: Option(List(MessageEntity)),
    voter_count: Int,
  )
}

pub type PollAnswer {
  PollAnswer(
    poll_id: String,
    voter_chat: Option(Chat),
    user: Option(User),
    option_ids: List(Int),
  )
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

pub type Dice {
  Dice(emoji: String, value: Int)
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

pub type LinkPreviewOptions {
  LinkPreviewOptions(
    is_disabled: Option(Bool),
    url: Option(String),
    prefer_smal_media: Option(Bool),
    prefer_large_media: Option(Bool),
    show_above_text: Option(Bool),
  )
}

pub type Story {
  Story(chat: Chat, id: Int)
}

pub type TextQuote {
  TextQuote(
    text: String,
    entities: Option(List(MessageEntity)),
    position: Int,
    is_manual: Option(Bool),
  )
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
}

pub type UniqueGiftInfo {
  UniqueGiftInfo(
    gift: UniqueGift,
    origin: String,
    owned_gift_id: Option(String),
    transfer_star_count: Option(Int),
  )
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

pub type UniqueGiftModel {
  UniqueGiftModel(name: String, sticker: Sticker, rarity_per_mille: Int)
}

pub type UniqueGiftSymbol {
  UniqueGiftSymbol(name: String, sticker: Sticker, rarity_per_mille: Int)
}

pub type UniqueGiftBackdrop {
  UniqueGiftBackdrop(
    name: String,
    colors: UniqueGiftBackdropColors,
    rarity_per_mille: Int,
  )
}

pub type UniqueGiftBackdropColors {
  UniqueGiftBackdropColors(
    center_color: Int,
    edge_color: Int,
    symbol_color: Int,
    text_color: Int,
  )
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
