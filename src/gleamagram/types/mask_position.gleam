import gleam/dynamic/decode

pub type MaskPosition {
  MaskPosition(point: String, x_shift: Float, y_shift: Float, scale: Float)
}

pub fn mask_position_decoder() -> decode.Decoder(MaskPosition) {
  use point <- decode.field("point", decode.string)
  use x_shift <- decode.field("x_shift", decode.float)
  use y_shift <- decode.field("y_shift", decode.float)
  use scale <- decode.field("scale", decode.float)
  decode.success(MaskPosition(point:, x_shift:, y_shift:, scale:))
}
