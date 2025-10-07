SMODS.Consumable {
    key = 'star',
    set = 'artifacts',
    pos = { x = 3, y = 0 },
    config = { extra = {
        copy_amount = 1
    } },
    loc_txt = {
        name = 'Star',
        text = {
        [1] = 'Create a copy of selected {C:attention}Joker{}'
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
            local _first_materialize = nil
        local self_card = G.jokers.highlighted[1]
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
            local copied_joker = copy_card(self_card, set_edition, nil, nil, false)
            copied_joker:start_materialize(nil, _first_materialize)
            self_card:add_to_deck()
            G.jokers:emplace(copied_joker)
            _first_materialize = true
              copied_joker:set_edition(nil, true)
                        return true
                    end
                }))
            delay(0.6)
        end
    end,
    can_use = function(self, card)
        return (#G.jokers.highlighted == 1)
    end
}