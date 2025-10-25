import gleam/dynamic/decode
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

pub fn sticker_decoder() -> decode.Decoder(Sticker) {
  use file_id <- decode.field("file_id", decode.string)
  use file_unique_id <- decode.field("file_unique_id", decode.string)
  use sticker_type <- decode.field("sticker_type", decode.string)
  use width <- decode.field("width", decode.int)
  use height <- decode.field("height", decode.int)
  use is_animated <- decode.field("is_animated", decode.bool)
  use is_video <- decode.field("is_video", decode.bool)
  use thumbnail <- decode.field(
    "thumbnail",
    decode.optional(file.photo_size_decoder()),
  )
  use emoji <- decode.field("emoji", decode.optional(decode.string))
  use set_name <- decode.field("set_name", decode.optional(decode.string))
  use premium_animation <- decode.field(
    "premium_animation",
    decode.optional(file.file_decoder()),
  )
  use mask_position <- decode.field(
    "mask_position",
    decode.optional(mask_position.mask_position_decoder()),
  )
  use custom_emoji_id <- decode.field(
    "custom_emoji_id",
    decode.optional(decode.string),
  )
  use needs_repainting <- decode.field(
    "needs_repainting",
    decode.optional(decode.bool),
  )
  use file_size <- decode.field("file_size", decode.optional(decode.int))
  decode.success(Sticker(
    file_id:,
    file_unique_id:,
    sticker_type:,
    width:,
    height:,
    is_animated:,
    is_video:,
    thumbnail:,
    emoji:,
    set_name:,
    premium_animation:,
    mask_position:,
    custom_emoji_id:,
    needs_repainting:,
    file_size:,
  ))
}
