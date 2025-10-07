SMODS.Rarity {
    key = "white_whistle",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('878787'),
    loc_txt = {
        name = "White Whistle"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}