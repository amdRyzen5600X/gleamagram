import gleam/dynamic
import gleam/dynamic/decode
import gleam/erlang/process
import gleam/http
import gleam/http/request
import gleam/httpc
import gleam/io
import gleam/option
import gleam/result
import gleam/string
import gleamagram/types/bot.{type Dispatcher}
import gleamagram/types/errors
import gleamagram/types/update

pub fn get_update(dp: Dispatcher) -> Result(List(update.Update), errors.Error) {
  let token = dp.bot.config.token
  let path = "/bot" <> token <> "/getUpdates"
  let url = dp.bot.config.server_url
  let req =
    request.Request(
      http.Get,
      [],
      "",
      http.Http,
      url,
      option.None,
      path,
      option.None,
    )
  case httpc.dispatch(dp.http_client, req) {
    Ok(resp) -> {
      case resp.status {
        200 -> {
          resp.body
          |> dynamic.string()
          |> decode.run(decode.list(update.update_decoder()))
          |> result.map_error(fn(_decoder_error) { errors.GetUpdatesError })
        }
        _ -> {
          Error(errors.GetUpdatesError)
        }
      }
    }
    Error(e) -> {
      io.print_error(
        "Error while trying to poll updates, retrying after 5 seconds\n"
        <> string.inspect(e),
      )
      process.sleep(5000)
      get_update(dp)
    }
  }
}
