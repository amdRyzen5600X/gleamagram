pub type GiveawayCompleted {
  GiveawayCompleted(
    winner_count: Int,
    unclaimed_prize_count: Option(Int),
    giveaway_message: Option(Message),
    is_star_giveaway: Option(Bool),
  )
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

pub type GiveawayCreated {
  GiveawayCreated(prize_star_count: Option(Int))
}
