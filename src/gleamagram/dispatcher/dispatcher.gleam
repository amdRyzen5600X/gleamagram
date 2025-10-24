import gleamagram/types/update
import gleam/io
import gleam/http
import gleam/http/request.{type Request}
import gleam/httpc
import gleam/option
import gleamagram/types/bot.{type Dispatcher}

pub fn get_update(dp: Dispatcher) -> List(update.Update) {
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
  let respone = case httpc.dispatch(dp.http_client, req){
        Ok(resp) -> resp
        Error(e) -> {
            io.print_error("Error while trying to poll updates, retrying after 5 seconds\n" <> e)
            get_update(dp)
        }
    }
}
