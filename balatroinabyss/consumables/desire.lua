SMODS.Consumable {
    key = 'desire',
    set = 'artifacts',
    pos = { x = 2, y = 0 },
    config = { extra = {
        odds = 3,
        joker_slots_value = 1,
        destroy_joker_amount = 1
    } },
    loc_txt = {
        name = 'Desire',
        text = {
        [1] = 'removes all stickers from target {C:attention}Joker{} and give it negative.',
        [2] = '{C:green}1 in 3{} chance to instead remove a {C:attention}Joker{} slot'
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
        if #G.jokers.highlighted == 1 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.jokers.highlighted do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.jokers.highlighted[i]:flip()
                        play_sound('card1', percent)
                        G.jokers.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.jokers.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.jokers.highlighted[i]:set_edition({ negative = true }, true)
                        return true
                    end
                }))
            end
            for i = 1, #G.jokers.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                    G.jokers.highlighted[1].ability.eternal = false
                    G.jokers.highlighted[1].ability.rental = false
                    G.jokers.highlighted[1].ability.perishable = false
                        return true
                    end
                }))
            end
            for i = 1, #G.jokers.highlighted do
                local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.jokers.highlighted[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.jokers.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.jokers:unhighlight_all()
                    return true
                end
            }))
            delay(0.5)
        end
        if #G.jokers.highlighted == 1 then
            if SMODS.pseudorandom_probability(card, 'group_0_22040419', 1, card.ability.extra.odds, 'c_Abyss_desire', false) then
                
                G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "-"..tostring(1).." Joker Slot", colour = G.C.RED})
                    G.jokers.config.card_limit = math.max(1, G.jokers.config.card_limit - 1)
                    return true
                end
            }))
            delay(0.6)
                local self_card = G.jokers.highlighted[1]
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
            card:juice_up(0.3, 0.5)
            return true end }))
        self_card:start_dissolve()
        delay(0.6)
            end
        end
    end,
    can_use = function(self, card)
        return (#G.jokers.highlighted == 1) or (#G.jokers.highlighted == 1)
    end
}