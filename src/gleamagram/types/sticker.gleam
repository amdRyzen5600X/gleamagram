import gleam/option.{type Option}
import gleamagram/types/file.{type File, type PhotoSize}
import gleamagram/types/mask_position.{type MaskPosition}

pub type Sticker {
  Sticker(
    file_id: String,
    file_unique_id: String,
    sticker_type: String,
    width: Int,
    height: Int,
    is_animated: Bool,
    is_video: Bool,
    thumbnail: Option(PhotoSize),
    emoji: Option(String),
    set_name: Option(String),
    premium_animation: Option(File),
    mask_position: Option(MaskPosition),
    custom_emoji_id: Option(String),
    needs_repainting: Option(Bool),
    file_size: Option(Int),
  )
}
