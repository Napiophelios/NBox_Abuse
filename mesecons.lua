--[[
--all code from MESECONS modpack
--by Jeija and contributors
--Licensed: LGPL version 3
--]]

--minor mesecons support

local nbea_rules = {
	{x=0,  y=0,  z=-1},
	{x=1,  y=0,  z=0},
	{x=-1, y=0,  z=0},
	{x=0,  y=0,  z=1},
	{x=1,  y=1,  z=0},
	{x=1,  y=-1, z=0},
	{x=-1, y=1,  z=0},
	{x=-1, y=-1, z=0},
	{x=0,  y=1,  z=1},
	{x=0,  y=-1, z=1},
	{x=0,  y=1,  z=-1},
	{x=0,  y=-1, z=-1},
	{x=0,  y=-1, z=0},
}

minetest.register_node("nbea:nbox_003_on", {
	description = "Inner-Cube",
	tiles = {"default_meselamp.png"},
	drawtype = "nodebox",
	paramtype = "light",
	light_source = 11,
	sunlight_propagates = true,
	is_ground_content = false,
    drop = "nbea:nbox_003",
	groups = {cracky = 3, mesecon = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_metal_defaults({
		footstep = {name = "default_glass_footstep", gain = 0.5},
		dug = {name = "default_break_glass", gain = 1.0},
	}),
	node_box = {
		type = "fixed",
		fixed = {
			-- corner frame
			{-0.5, 0.4375, -0.4375, -0.4375, 0.5, 0.4375},
			{-0.5, -0.5, -0.4375, -0.4375, -0.4375, 0.4375},
			{-0.5, -0.5, -0.5, -0.4375, 0.5, -0.4375},
			{-0.5, -0.5, 0.4375, -0.4375, 0.5, 0.5},
			{-0.4375, 0.4375, -0.5, 0.4375, 0.5, -0.4375},
			{-0.4375, -0.5, -0.5, 0.4375, -0.4375, -0.4375},
			{-0.4375, 0.4375, 0.4375, 0.4375, 0.5, 0.5},
			{-0.4375, -0.5, 0.4375, 0.4375, -0.4375, 0.5},
			{0.4375, 0.4375, -0.5, 0.5, 0.5, 0.5},
			{0.4375, -0.5, -0.5, 0.5, -0.4375, 0.5},
			{0.4375, -0.4375, 0.4375, 0.5, 0.4375, 0.5},
			{0.4375, -0.4375, -0.5, 0.5, 0.4375, -0.4375},
			-- center mass 6px
			{-0.1875, -0.1875, -0.1875, 0.1875, 0.1875, 0.1875},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
	mesecons = {effector = {
        rules = nbea_rules,
        action_off = function (pos, node)
            minetest.swap_node(pos, {name = "nbea:nbox_003", param2 = node.param2})
        end,
    }}
})

minetest.register_node("nbea:nbox_005_off", {
	description = "Core Sample",
	inventory_image = "nbea_core.png^nbea_steel.png",
	wield_image = "nbea_core.png^nbea_steel.png",
    tiles = {"nbea_core.png^nbea_steel.png"},
	use_texture_alpha = true,
	drawtype = "nodebox",
	paramtype = "light",
	light_source = 3,
	sunlight_propagates = true,
	climbable = true,
	is_ground_content = false,
	groups = {cracky = 3, mesecon_effector_off = 1, mesecon = 1},
	sounds = default.node_sound_metal_defaults({
		footstep = {name = "default_glass_footstep", gain = 0.5},
		dug = {name = "default_break_glass", gain = 1.0},
	}),
	node_box = {
		type = "fixed",
		fixed = {
			-- top (Y+)
			{-0.4375, 0.4375, 0.375, 0.4375, 0.5, 0.4375},
			{-0.4375, 0.4375, 0.25, 0.4375, 0.5, 0.3125},
			{-0.4375, 0.4375, -0.3125, 0.4375, 0.5, -0.25},
			{-0.4375, 0.4375, -0.4375, 0.4375, 0.5, -0.375},
			{-0.4375, 0.4375, -0.4375, -0.375, 0.5, 0.4375},
			{0.375, 0.4375, -0.4375, 0.4375, 0.5, 0.4375},
			{-0.3125, 0.4375, -0.375, -0.25, 0.5, 0.375},
			{0.25, 0.4375, -0.375, 0.3125, 0.5, 0.375},
			-- bottom (Y-)
			{-0.4375, -0.5, 0.375, 0.4375, -0.4375, 0.4375},
			{-0.4375, -0.5, 0.25, 0.4375, -0.4375, 0.3125},
			{-0.4375, -0.5, -0.3125, 0.4375, -0.4375, -0.25},
			{-0.4375, -0.5, -0.4375, 0.4375, -0.4375, -0.375},
			{0.375, -0.5, -0.4375, 0.4375, -0.4375, 0.4375},
			{-0.4375, -0.5, -0.4375, -0.375, -0.4375, 0.4375},
			{0.25, -0.5, -0.375, 0.3125, -0.4375, 0.375},
			{-0.3125, -0.5, -0.375, -0.25, -0.4375, 0.375},
			-- right (X+)
			{0.4375, -0.4375, 0.375, 0.5, 0.4375, 0.4375},
			{0.4375, -0.4375, 0.25, 0.5, 0.4375, 0.3125},
			{0.4375, -0.4375, -0.3125, 0.5, 0.4375, -0.25},
			{0.4375, -0.4375, -0.4375, 0.5, 0.4375, -0.375},
			{0.4375, 0.375, -0.4375, 0.5, 0.4375, 0.4375},
			{0.4375, -0.4375, -0.4375, 0.5, -0.375, 0.4375},
			{0.4375, 0.25, -0.375, 0.5, 0.3125, 0.375},
			{0.4375, -0.3125, -0.375, 0.5, -0.25, 0.375},
			-- left (X-)
			{-0.5, -0.4375, -0.4375, -0.4375, 0.4375, -0.375},
			{-0.5, -0.4375, -0.3125, -0.4375, 0.4375, -0.25},
			{-0.5, -0.4375, 0.25, -0.4375, 0.4375, 0.3125},
			{-0.5, -0.4375, 0.375, -0.4375, 0.4375, 0.4375},
			{-0.5, 0.375, -0.4375, -0.4375, 0.4375, 0.4375},
			{-0.5, -0.4375, -0.4375, -0.4375, -0.375, 0.4375},
			{-0.5, 0.25, -0.375, -0.4375, 0.3125, 0.375},
			{-0.5, -0.3125, -0.375, -0.4375, -0.25, 0.375},
			-- back (Z+)
			{-0.4375, -0.4375, 0.4375, -0.375, 0.4375, 0.5},
			{-0.3125, -0.4375, 0.4375, -0.25, 0.4375, 0.5},
			{0.25, -0.4375, 0.4375, 0.3125, 0.4375, 0.5},
			{0.375, -0.4375, 0.4375, 0.4375, 0.4375, 0.5},
			{-0.4375, 0.375, 0.4375, 0.4375, 0.4375, 0.5},
			{-0.4375, -0.4375, 0.4375, 0.4375, -0.375, 0.5},
			{-0.375, 0.25, 0.4375, 0.375, 0.3125, 0.5},
			{-0.375, -0.3125, 0.4375, 0.375, -0.25, 0.5},
			-- front (Z-)
			{0.375, -0.4375, -0.5, 0.4375, 0.4375, -0.4375},
			{0.25, -0.4375, -0.5, 0.3125, 0.4375, -0.4375},
			{-0.3125, -0.4375, -0.5, -0.25, 0.4375, -0.4375},
			{-0.4375, -0.4375, -0.5, -0.375, 0.4375, -0.4375},
			{-0.4375, 0.375, -0.5, 0.4375, 0.4375, -0.4375},
			{-0.4375, -0.4375, -0.5, 0.4375, -0.375, -0.4375},
			{-0.375, 0.25, -0.5, 0.375, 0.3125, -0.4375},
			{-0.375, -0.3125, -0.5, 0.375, -0.25, -0.4375},
			-- center mass 2px--0.0625 / 4px--0.125
			{-0.0625, -0.0625, -0.0625, 0.0625, 0.0625, 0.0625},
			-- corner frame
			{-0.4375, 0.4375, 0.4375, 0.4375, 0.5, 0.5},
			{-0.4375, -0.5, 0.4375, 0.4375, -0.4375, 0.5},
			{-0.5, -0.5, 0.4375, -0.4375, 0.5, 0.5},
			{0.4375, -0.5, 0.4375, 0.5, 0.5, 0.5},
			{-0.5, 0.4375, -0.4375, -0.4375, 0.5, 0.4375},
			{-0.5, -0.5, -0.4375, -0.4375, -0.4375, 0.4375},
			{0.4375, 0.4375, -0.4375, 0.5, 0.5, 0.4375},
			{0.4375, -0.5, -0.4375, 0.5, -0.4375, 0.4375},
			{-0.5, 0.4375, -0.5, 0.5, 0.5, -0.4375},
			{-0.5, -0.5, -0.5, 0.5, -0.4375, -0.4375},
			{0.4375, -0.4375, -0.5, 0.5, 0.4375, -0.4375},
			{-0.5, -0.4375, -0.5, -0.4375, 0.4375, -0.4375},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
	mesecons = {effector = {
        rules = nbea_rules,
        action_on = function (pos, node)
            minetest.swap_node(pos, {name = "nbea:nbox_005", param2 = node.param2})
        end,
    }},
})

minetest.override_item("nbea:nbox_003", {
	light_source = 3,
	groups = {cracky = 3,  mesecon_effector_off = 1, mesecon = 3},
	mesecons = {effector = {
        rules = nbea_rules,
        action_on = function (pos, node)
            minetest.swap_node(pos, {name = "nbea:nbox_003_on", param2 = node.param2})
        end,
    }}
})

minetest.override_item("nbea:nbox_004", {
	groups = {cracky = 1, mesecon = 1},
	mesecons = {receptor = {
		state = mesecon.state.on
	}}
})

minetest.override_item("nbea:nbox_005", {
	light_source = 11,
	groups = {cracky = 3, mesecon = 1, not_in_creative_inventory = 1},
    drop = "nbea:nbox_005_off",
	mesecons = {effector = {
        rules = nbea_rules,
        action_off = function (pos, node)
            minetest.swap_node(pos, {name = "nbea:nbox_005_off", param2 = node.param2})
        end,
    }}
})
