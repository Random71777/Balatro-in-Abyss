SMODS.Booster {
    key = 'relic_pack',
    loc_txt = {
        name = "Relic pack",
        text = {
            "Choose 1 of up to 3 Relic cards to be used immediately"
        },
        group_name = "Relic pack"
    },
    config = { extra = 3, choose = 1 },
    cost = 6,
    weight = 3,
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    draw_hand = true,
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "artifacts",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "Abyss_relic_pack"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("ac8565"))
        ease_background_colour({ new_colour = HEX('ac8565'), special_colour = HEX("ab6161"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}
