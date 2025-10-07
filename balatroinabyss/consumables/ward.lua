SMODS.Consumable {
    key = 'ward',
    set = 'artifacts',
    pos = { x = 5, y = 0 },
    config = { extra = {
        odds = 4
    } },
    loc_txt = {
        name = 'Ward',
        text = {
        [1] = 'Gives target {C:attention}Joker{} a random {C:dark_edition}Edition{} {C:green}',
        [2] = '1 in 4{} chance to give target {C:attention}Joker{} perishable instead'
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
                        local edition = poll_edition('random_edition', nil, true, true, 
                            { 'e_polychrome', 'e_holo', 'e_foil' })
                        G.jokers.highlighted[i]:set_edition(edition, true)
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
            if SMODS.pseudorandom_probability(card, 'group_0_975577c7', 1, card.ability.extra.odds, 'c_Abyss_ward', false) then
                
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
                        G.jokers.highlighted[i]:add_sticker('perishable', true)
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
        end
    end,
    can_use = function(self, card)
        return (#G.jokers.highlighted == 1) or (#G.jokers.highlighted == 1)
    end
}