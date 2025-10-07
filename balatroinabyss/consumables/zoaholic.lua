SMODS.Consumable {
    key = 'zoaholic',
    set = 'artifacts',
    pos = { x = 6, y = 0 },
    config = { extra = {
        destroy_joker_amount = 1
    } },
    loc_txt = {
        name = 'Zoaholic',
        text = {
        [1] = 'Turns target {C:attention}Joker{} into a copy of Bondrewd'
    }
    },
    cost = 5,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.4,
                  func = function()
                      play_sound('timpani')
                      if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                          G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                      local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_Abyss_bondrewd' })
                      if new_joker then
                      end
                          G.GAME.joker_buffer = 0
                      end
                      used_card:juice_up(0.3, 0.5)
                      return true
                  end
              }))
              delay(0.6)
        if #G.jokers.highlighted == 1 then
            local self_card = G.jokers.highlighted[1]
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
            card:juice_up(0.3, 0.5)
            return true end }))
        self_card:start_dissolve()
        delay(0.6)
        end
    end,
    can_use = function(self, card)
        return (#G.jokers.highlighted == 1)
    end
}