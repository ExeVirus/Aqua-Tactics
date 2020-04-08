//Fins.lua implements the wearable item, fins. 
//When worn, this item makes the user faster underwater, 
//...but slower out of the water.

//It also has a configurable wear value, typically set to 300 seconds (5 minutes), feel free to modify as you see fit
local use_player_monoids = minetest.global_exists("player_monoids")
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
            if(use_player_monoids) then
                if(in_water)   then
                    //set armor override
                else
                    //set armor override   
                end
            else
                if(in_water)   then
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
            end //
            //Set Register Global fins variable to true   
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
            //Set Register Global fins variable to flase
        end,
})
  
minetest.register_craft{'aqua-tactics:fins', recipe={
    {'', '', ''},
    {'', '', ''}
}}
          
          
          
          
          
     end //If 3D armor mod is available
