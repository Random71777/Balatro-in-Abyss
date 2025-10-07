SMODS.Joker{ --Bondrewd
    key = "bondrewd",
    config = {
        extra = {
            consumablesheld = 0
        }
    },
    loc_txt = {
        ['name'] = 'Bondrewd',
        ['text'] = {
            [1] = 'This Joker gains {X:red,C:white}X2{} Mult per consumables held',
            [2] = '(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "Abyss_white_whistle",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Abyss_balatroi_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {((#(G.consumeables and G.consumeables.cards or {}) or 0)) * 2}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = (#(G.consumeables and G.consumeables.cards or {})) * 2
                }
        end
    end
}