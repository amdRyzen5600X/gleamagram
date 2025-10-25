import gleam/dynamic/decode
import gleam/option.{type Option}
import gleamagram/types/user

pub type PhotoSize {
  PhotoSize(
    file_id: String,
    file_unique_id: String,
    width: Int,
    height: Int,
    file_size: Int,
  )
}

pub fn photo_size_decoder() -> decode.Decoder(PhotoSize) {
  use file_id <- decode.field("file_id", decode.string)
  use file_unique_id <- decode.field("file_unique_id", decode.string)
  use width <- decode.field("width", decode.int)
  use height <- decode.field("height", decode.int)
  use file_size <- decode.field("file_size", decode.int)
  decode.success(PhotoSize(
    file_id:,
    file_unique_id:,
    width:,
    height:,
    file_size:,
  ))
}

pub type Voice {
  Voice(
    file_id: String,
    file_unique_id: String,
    duration: Int,
    mime_type: Option(String),
    file_size: Option(Int),
  )
}

pub fn voice_decoder() -> decode.Decoder(Voice) {
  use file_id <- decode.field("file_id", decode.string)
  use file_unique_id <- decode.field("file_unique_id", decode.string)
  use duration <- decode.field("duration", decode.int)
  use mime_type <- decode.field("mime_type", decode.optional(decode.string))
  use file_size <- decode.field("file_size", decode.optional(decode.int))
  decode.success(Voice(
    file_id:,
    file_unique_id:,
    duration:,
    mime_type:,
    file_size:,
  ))
}

pub type VideoNote {
  VideoNote(
    file_id: String,
    file_unique_id: String,
    length: Int,
    duration: Int,
    thumbnail: Option(PhotoSize),
    file_size: Option(Int),
  )
}

pub fn video_note_decoder() -> decode.Decoder(VideoNote) {
  use file_id <- decode.field("file_id", decode.string)
  use file_unique_id <- decode.field("file_unique_id", decode.string)
  use length <- decode.field("length", decode.int)
  use duration <- decode.field("duration", decode.int)
  use thumbnail <- decode.field(
    "thumbnail",
    decode.optional(photo_size_decoder()),
  )
  use file_size <- decode.field("file_size", decode.optional(decode.int))
  decode.success(VideoNote(
    file_id:,
    file_unique_id:,
    length:,
    duration:,
    thumbnail:,
    file_size:,
  ))
}

pub type File {
  File(
    file_id: String,
    file_unique_id: String,
    file_size: Option(Int),
    file_path: Option(String),
  )
}

pub fn file_decoder() -> decode.Decoder(File) {
  use file_id <- decode.field("file_id", decode.string)
  use file_unique_id <- decode.field("file_unique_id", decode.string)
  use file_size <- decode.field("file_size", decode.optional(decode.int))
  use file_path <- decode.field("file_path", decode.optional(decode.string))
  decode.success(File(file_id:, file_unique_id:, file_size:, file_path:))
}

pub type PaidMediaInfo {
  PaidMediaInfo(star_count: Int, paid_media: List(PaidMedia))
}

pub fn paid_media_info_decoder() -> decode.Decoder(PaidMediaInfo) {
  use star_count <- decode.field("star_count", decode.int)
  use paid_media <- decode.field(
    "paid_media",
    decode.list(paid_media_decoder()),
  )
  decode.success(PaidMediaInfo(star_count:, paid_media:))
}

pub type PaidMedia {
  PaidMediaPreview(
    paid_media_type: String,
    width: Option(Int),
    height: Option(Int),
    duration: Option(Int),
  )
  PaidMediaPhoto(paid_media_type: String, photo: List(PhotoSize))
  PaidMediaVideo(paid_media_type: String, video: Video)
  InvalidPaidMedia
}

pub fn paid_media_decoder() -> decode.Decoder(PaidMedia) {
  use variant <- decode.field("type", decode.string)
  case variant {
    "paid_media_preview" -> {
      use paid_media_type <- decode.field("paid_media_type", decode.string)
      use width <- decode.field("width", decode.optional(decode.int))
      use height <- decode.field("height", decode.optional(decode.int))
      use duration <- decode.field("duration", decode.optional(decode.int))
      decode.success(PaidMediaPreview(
        paid_media_type:,
        width:,
        height:,
        duration:,
      ))
    }
    "paid_media_photo" -> {
      use paid_media_type <- decode.field("paid_media_type", decode.string)
      use photo <- decode.field("photo", decode.list(photo_size_decoder()))
      decode.success(PaidMediaPhoto(paid_media_type:, photo:))
    }
    "paid_media_video" -> {
      use paid_media_type <- decode.field("paid_media_type", decode.string)
      use video <- decode.field("video", video_decoder())
      decode.success(PaidMediaVideo(paid_media_type:, video:))
    }
    _ -> decode.failure(InvalidPaidMedia, "PaidMedia")
  }
}

pub type Video {
  Video(
    file_id: String,
    file_unique_id: String,
    width: Int,
    height: Int,
    duration: Int,
    thumbnail: Option(PhotoSize),
    cover: Option(List(PhotoSize)),
    start_timestamp: Option(Int),
    file_name: Option(String),
    mime_type: Option(String),
    file_size: Option(Int),
  )
}

pub fn video_decoder() -> decode.Decoder(Video) {
  use file_id <- decode.field("file_id", decode.string)
  use file_unique_id <- decode.field("file_unique_id", decode.string)
  use width <- decode.field("width", decode.int)
  use height <- decode.field("height", decode.int)
  use duration <- decode.field("duration", decode.int)
  use thumbnail <- decode.field(
    "thumbnail",
    decode.optional(photo_size_decoder()),
  )
  use cover <- decode.field(
    "cover",
    decode.optional(decode.list(photo_size_decoder())),
  )
  use start_timestamp <- decode.field(
    "start_timestamp",
    decode.optional(decode.int),
  )
  use file_name <- decode.field("file_name", decode.optional(decode.string))
  use mime_type <- decode.field("mime_type", decode.optional(decode.string))
  use file_size <- decode.field("file_size", decode.optional(decode.int))
  decode.success(Video(
    file_id:,
    file_unique_id:,
    width:,
    height:,
    duration:,
    thumbnail:,
    cover:,
    start_timestamp:,
    file_name:,
    mime_type:,
    file_size:,
  ))
}

pub type Document {
  Document(
    file_id: String,
    file_unique_id: String,
    thumbnail: Option(PhotoSize),
    file_name: Option(String),
    mime_type: Option(String),
    file_size: Option(Int),
  )
}

pub fn document_decoder() -> decode.Decoder(Document) {
  use file_id <- decode.field("file_id", decode.string)
  use file_unique_id <- decode.field("file_unique_id", decode.string)
  use thumbnail <- decode.field(
    "thumbnail",
    decode.optional(photo_size_decoder()),
  )
  use file_name <- decode.field("file_name", decode.optional(decode.string))
  use mime_type <- decode.field("mime_type", decode.optional(decode.string))
  use file_size <- decode.field("file_size", decode.optional(decode.int))
  decode.success(Document(
    file_id:,
    file_unique_id:,
    thumbnail:,
    file_name:,
    mime_type:,
    file_size:,
  ))
}

pub type Audio {
  Audio(
    file_id: String,
    file_unique_id: String,
    duration: Int,
    performer: Option(String),
    title: Option(String),
    file_name: Option(String),
    mime_type: Option(String),
    file_size: Option(Int),
    thumbnail: Option(PhotoSize),
  )
}

pub fn audio_decoder() -> decode.Decoder(Audio) {
  use file_id <- decode.field("file_id", decode.string)
  use file_unique_id <- decode.field("file_unique_id", decode.string)
  use duration <- decode.field("duration", decode.int)
  use performer <- decode.field("performer", decode.optional(decode.string))
  use title <- decode.field("title", decode.optional(decode.string))
  use file_name <- decode.field("file_name", decode.optional(decode.string))
  use mime_type <- decode.field("mime_type", decode.optional(decode.string))
  use file_size <- decode.field("file_size", decode.optional(decode.int))
  use thumbnail <- decode.field(
    "thumbnail",
    decode.optional(photo_size_decoder()),
  )
  decode.success(Audio(
    file_id:,
    file_unique_id:,
    duration:,
    performer:,
    title:,
    file_name:,
    mime_type:,
    file_size:,
    thumbnail:,
  ))
}

pub type Animation {
  Animation(
    file_id: String,
    file_unique_id: String,
    width: Int,
    height: Int,
    duration: Int,
    thumbnail: Option(PhotoSize),
    file_name: Option(String),
    mime_type: Option(String),
    file_size: Option(Int),
  )
}

pub fn animation_decoder() -> decode.Decoder(Animation) {
  use file_id <- decode.field("file_id", decode.string)
  use file_unique_id <- decode.field("file_unique_id", decode.string)
  use width <- decode.field("width", decode.int)
  use height <- decode.field("height", decode.int)
  use duration <- decode.field("duration", decode.int)
  use thumbnail <- decode.field(
    "thumbnail",
    decode.optional(photo_size_decoder()),
  )
  use file_name <- decode.field("file_name", decode.optional(decode.string))
  use mime_type <- decode.field("mime_type", decode.optional(decode.string))
  use file_size <- decode.field("file_size", decode.optional(decode.int))
  decode.success(Animation(
    file_id:,
    file_unique_id:,
    width:,
    height:,
    duration:,
    thumbnail:,
    file_name:,
    mime_type:,
    file_size:,
  ))
}

pub type PaidMediaPurchased {
  PaidMediaPurchased(from: user.User, paid_media_payload: String)
}

pub fn paid_media_purchased_decoder() -> decode.Decoder(PaidMediaPurchased) {
  use from <- decode.field("from", user.user_decoder())
  use paid_media_payload <- decode.field("paid_media_payload", decode.string)
  decode.success(PaidMediaPurchased(from:, paid_media_payload:))
}
