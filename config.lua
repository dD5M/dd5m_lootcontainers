Config = {}

-- ## Loot table
Config.loottable = {
    default = {
        [1] = {item = 'ammo-9',             chances = 3,    min = 1,    max = 3},
        [2] = {item = 'assmeth',            chances = 40,   min = 1,    max = 3},
        [3] = {item = 'plastic_bag_bulk',   chances = 78,   min = 1,    max = 3},
        [4] = {item = 'steel',              chances = 27,   min = 1,    max = 3},
        [5] = {item = 'advancedlockpick',   chances = 1,    min = 1,    max = 3},
        [6] = {item = 'aluminum',           chances = 27,   min = 1,    max = 3},
        [7] = {item = 'metalscrap',         chances = 27,   min = 1,    max = 3},
        [8] = {item = 'rubber',             chances = 27,   min = 1,    max = 3},
        [9] = {item = 'copper',             chances = 27,   min = 1,    max = 3},
        [10] = {item = 'glass',             chances = 27,   min = 1,    max = 3},
        [11] = {item = 'plastic',           chances = 27,   min = 1,    max = 3},
        [12] = {item = 'iron',              chances = 27,   min = 1,    max = 3},
    }
}

Config.animations = {
    default = {
        dict = 'veh@break_in@0h@p_m_one@',
        clip = 'low_force_entry_ds',
        flag = 16
    }
}

Config.Props = {
    {  --truck trailer
        prop = `prop_truktrailer_01a`,
        settings = {
            targetLabel = 'Loot Truck',
            loot = Config.loottable.default,
            minigame = 'ox_lib',
            illegal = true,
            alertchance = 10,

            requireditem = 'WEAPON_CROWBAR',
            canlootmultiple = false,
            maxlootitem = 3, --If canlootmultiple is true
            anim = Config.animations.default,
            progressText = 'Opening Container',
            progressTime = '5'
        }
    },
    {  --Metal container
        prop = `prop_container_05a`,
        settings = {
            targetLabel = 'Loot Container',
            loot = Config.loottable.default,
            minigame = 'ox_lib',
            illegal = true,
            alertchance = 10,
            requireditem = 'WEAPON_CROWBAR',
            canlootmultiple = false,
            maxlootitem = 3, --If canlootmultiple is true
            anim = Config.animations.default,
            progressText = 'Opening Container',
            progressTime = '5'

        }
    },
    {  --Metal container
        prop =  `prop_container_old1`,
        settings = {
            targetLabel = 'Loot Container',
            loot = Config.loottable.default,
            minigame = 'ox_lib',
            illegal = true,
            alertchance = 10,
            requireditem = 'WEAPON_CROWBAR',
            canlootmultiple = false,
            maxlootitem = 3, --If canlootmultiple is true
            anim = Config.animations.default,
            progressText = 'Opening Container',
            progressTime = '5'

        }
    },
    {  --Metal container
        prop = `prop_contr_03b_ld`,
        settings = {
            targetLabel = 'Loot Container',
            loot = Config.loottable.default,
            minigame = 'ox_lib',
            illegal = true,
            alertchance = 10,
            requireditem = 'WEAPON_CROWBAR',
            canlootmultiple = false,
            maxlootitem = 3, --If canlootmultiple is true
            anim = Config.animations.default,
            progressText = 'Opening Container',
            progressTime = '5'

        }
    },
    {  -- airport luggage 1
        prop = `prop_air_trailer_1a`,
        settings = {
            targetLabel = 'Loot Luggage',
            loot = Config.loottable.default,
            minigame = 'ox_lib',
            illegal = true,
            alertchance = 10,
            requireditem = 'WEAPON_CROWBAR',
            canlootmultiple = false,
            maxlootitem = 3, --If canlootmultiple is true
            anim = Config.animations.default,
            progressText = 'Opening Container',
            progressTime = '5'

        }
    },
    {  --airport luggage 2
        prop = `prop_air_cargo_01b`,
        settings = {
            targetLabel = 'Loot Luggage',
            loot = Config.loottable.default,
            minigame = 'ox_lib',
            illegal = true,
            alertchance = 10,
            requireditem = 'WEAPON_CROWBAR',
            canlootmultiple = false,
            maxlootitem = 3, --If canlootmultiple is true
            anim = Config.animations.default,
            progressText = 'Opening Container',
            progressTime = '5'

        }
    },
    {  --airport luggage 3
        prop = `prop_air_trailer_1b`,
        settings = {
            targetLabel = 'Loot Luggage',
            loot = Config.loottable.default,
            minigame = 'ox_lib',
            illegal = true,
            alertchance = 10,
            requireditem = 'WEAPON_CROWBAR',
            canlootmultiple = false,
            maxlootitem = 3, --If canlootmultiple is true
            anim = Config.animations.default,
            progressText = 'Opening Container',
            progressTime = '5'

        }
    },
    {  --Pallet 'Boxes' 1
        prop = `prop_boxpile_07d`,
        settings = {
            targetLabel = 'Loot Boxes',
            loot = Config.loottable.default,
            minigame = 'ox_lib',
            illegal = true,
            alertchance = 10,
            canlootmultiple = false,
            maxlootitem = 3, --If canlootmultiple is true
            anim = Config.animations.default,
            progressText = 'Opening Container',
            progressTime = '5'

        }
    },
    {  --Pallet Boxes 2
        prop = `prop_boxpile_08a`,
        settings = {
            targetLabel = 'Loot Boxes',
            loot = Config.loottable.default,
            minigame = 'ox_lib',
            illegal = true,
            alertchance = 10,
            canlootmultiple = false,
            maxlootitem = 3, --If canlootmultiple is true
            anim = Config.animations.default,
            progressText = 'Opening Container',
            progressTime = '5'

        }
    },
    -- {  --Custom Loot table example
    --     prop = -188983024,
    --     settings = {            targetLabel = 'Loot Container',
    --         loot = {
    --             [1] = {item = 'ammo-9',              chances = 3,    min = 1,    max = 3},
    --             [2] = {item = 'assmeth',             chances = 40,   min = 1,    max = 3},
    --             [3] = {item = 'plastic_bag_bulk',    chances = 78,   min = 1,    max = 3},
    --             [4] = {item = 'steel',               chances = 27,   min = 1,    max = 3},
    --          },
    --        minigame = 'ox_lib',
    --        illegal = true,
    --        alertchance = 10,
    --        requireditem = 'WEAPON_CROWBAR',
    --        canlootmultiple = false,
    --        maxlootitem = 3 --If canlootmultiple is true
    --     },
    -- },
}


-- ## Reset Configs
Config.ResetOnReboot = false
Config.ResetTime = 15 -- If Config.ResetOnReboot = false. In minutes

-- ## Time Configs
Config.ProgressTime = 3 -- In secondes

-- ## Police Configs
Config.Dispatch = 'cd_dispatch' -- Available options: 'cd_dispatch' or 'qb-core'


-- ## Hurting Configs
Config.Hurting = true -- True will give a chance to the player to be hurt
Config.HurtChance = 40 -- If Config.Hurting = true. In percentage
Config.CanBleed = true -- Can the player bleed? / Requires qb-ambulancejob
Config.BleedChance = 30 -- If Config.CanBleed = true. In percentage
Config.HurtDamage = {
    min = 5,
    max = 15,
}
