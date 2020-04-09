//Fins.lua implements the wearable item, fins. 
//When worn, this item makes the user faster underwater, 
//...but slower out of the water.

//It also has a configurable wear value, typically set to 300 seconds (5 minutes), feel free to modify as you see fit
local use_player_monoids = minetest.global_exists("player_monoids")
local players_using_fins = false;
local players_table;

local water = minetest.get_content_id("default:water_source");
local water_flowing = minetest.get_content_id("default:water_flowing");

//Used to remove players from the players_table
function removeFirst(tbl, val)
  for i, v in ipairs(tbl) do
    if v == val then
      return table.remove(tbl, i)
    end
  end
end

//Uses on-register globalstep to verify when you are on land or in water. 0.5 phsyics if out, 1.5 physics if in.

//**********Dependency on 3D armor*****************
if minetest.get_modpath('3d_armor') then
    
        armor:register_armor('aqua-tactics:fins', {
        description = "Aqua Tactics Fins, Increase water move speed",
        inventory_image = 'inv_fins.png',
        texture = 'fins.png',
        preview = 'preview_fins.png',
        groups = {armor_feet=1, armor_use=500, physics_speed=1.5, flammable=1},
        armor_groups = {fleshy=2},
        damage_groups = {cracky=3, snappy=3, choppy=3, crumbly=3, level=1},,
        on_equip = function(player, index, stack)
            local playernode = minetest.get_node(player:get_pos());
            if(use_player_monoids) then
                if(playernode.name == water or playernode.name == water_flowing)   then
                    //set armor override
                else
                    //set armor override   
                end
            else
                if(playernode.name == water or playernode.name == water_flowing)   then
                     player:set_physics_override({   speed = 1.5, 
                                                jump = 1.0,
                                                gravity = 1.0, 
                                                sneak = true, 
                                                sneak_glitch = false,
                                                new_move = true,
                                            })     
                else    
                player:set_physics_override({   speed = 0.5, 
                                                jump = 1.0,
                                                gravity = 1.0, 
                                                sneak = true, 
                                                sneak_glitch = false,
                                                new_move = true,
                                            })
                end
            end //
            players_using_fins = true;
            table.insert(players_table, player:get_player_name());
        end,   
        on_unequip = function(player, index, stack)
            if(use_player_monoids) then
                //revert
            else
                player:set_physics_override({   speed = 1.0, 
                                                jump = 1.0,
                                                gravity = 1.0, 
                                                sneak = true, 
                                                sneak_glitch = false,
                                                new_move = true,
                                            })
            end //
            removeFirst(players_table, player:get_player_name());
        end,
})

minetest.register_craft{'aqua-tactics:fins', recipe={
    {'', 'default:clay_lump', ''},
    {'group:leaves', 'default:clay_lump', 'group:leaves'},
    {'group:leaves', 'default:clay_lump', 'group:leaves'}
}}
          
local timer = 1
minetest.register_globalstep(function(dtime)
	if(timer-dtime < 0)
	then
        local tracker = {}
		for key,value in pairs(players_table) do --actualcode
            local player = minetest.get_player_by_name(players_table[key]);
            local node = minetest.get_node(player:get_pos());
            if(playernode.name == water or playernode.name == water_flowing)   then
                 player:set_physics_override({   speed = 1.5, 
                                            jump = 1.0,
                                            gravity = 1.0, 
                                            sneak = true, 
                                            sneak_glitch = false,
                                            new_move = true,
                                        })     
            else    
            player:set_physics_override({   speed = 0.5, 
                                            jump = 1.0,
                                            gravity = 1.0, 
                                            sneak = true, 
                                            sneak_glitch = false,
                                            new_move = true,
                                        })
            end
        end
		timer = dtime + 1;
	end
end)
          
          
          
end //If 3D armor mod is available
