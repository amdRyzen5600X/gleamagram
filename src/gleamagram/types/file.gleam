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

pub type Voice {
  Voice(
    file_id: String,
    file_unique_id: String,
    duration: Int,
    mime_type: Option(String),
    file_size: Option(Int),
  )
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

pub type File {
  File(
    file_id: String,
    file_unique_id: String,
    file_size: Option(Int),
    file_path: Option(String),
  )
}

pub type PaidMediaInfo {
  PaidMediaInfo(star_count: Int, paid_media: List(PaidMedia))
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

pub type PaidMediaPurchased {
  PaidMediaPurchased(from: user.User, paid_media_payload: String)
}
