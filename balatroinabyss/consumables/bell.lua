SMODS.Consumable {
    key = 'bell',
    set = 'artifacts',
    pos = { x = 0, y = 0 },
    config = { extra = {
        totalhandlevels = 0
    } },
    loc_txt = {
        name = 'Bell',
        text = {
        [1] = 'Gives Money equal to total sum of all levels',
        [2] = '{C:inactive}(Max of {C:money}$100{}){}'
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
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring((function() local total = 0; for hand, data in pairs(G.GAME.hands) do if data.level >= to_big(1) then total = total + data.level end end; return total end)()).." $", colour = G.C.MONEY})
                    ease_dollars((function() local total = 0; for hand, data in pairs(G.GAME.hands) do if data.level >= to_big(1) then total = total + data.level end end; return total end)(), true)
                    return true
                end
            }))
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}