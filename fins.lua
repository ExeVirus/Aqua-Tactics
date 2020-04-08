//Fins.lua implements the wearable item, fins. 
//When worn, this item makes the user faster underwater, 
//...but slower out of the water.

//It also has a configurable wear value, typically set to 300 seconds (5 minutes), feel free to modify as you see fit

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
                //Set Register Global fins variable to true
                //Check if in water, if not, set physics_speed back to 0.5.
                        
        end,
})
  
minetest.register_craft{'aqua-tactics:fins', recipe={
    {'', '', ''},
    {'', '', ''}
}}
          
          
          
          
          
     end //If 3D armor mod is available
