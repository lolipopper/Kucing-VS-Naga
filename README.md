# Kucing-VS-Naga
1. Consult file .pl lalu masukan "start."
2. Masukan perintah aksi yang ingin dilakukan
--look
--sleeping
--readmap
--goto(place)
--take(object)
--sharpen(object)
--quit
Pastikan ada titik di akhir tiap baris input aksi.

1. Consult file .pl lalu masukan "start."
2. Masukan perintah aksi yang ingin dilakukan
--look
--sleeping
--readmap
--goto(place)
--take(object)
--sharpen(object)
--quit
Pastikan ada titik di akhir tiap baris input aksi.
| ?- start.
Tio the Shining Armor
Welcome to Tio's World where nothing is important!
Find the princess for Tio the Knight by exploring this nonsense world!
You can explore by using these command
--look
--sleeping
--readmap
--goto(place)
--take(object)
--sharpen(object)
--quit

> look.
You are located at castle
You can see : armor, shield, maps
Currently you have : 

> sleeping.
You should go to the bedroom first.

> readmaps.
Invalid command.

> take(dodo).
Sorry! No dodo in here.

> take(armor).
Tio took a armor and put it in his bag.

> look.
You are located at castle
You can see : shield, maps
Currently you have : armor

> readmap.
You can't read map because you don't have it

> take(maps).
Tio took a maps and put it in his bag.

> readmap.
._____________________________________________________________.
|            |            |             |                     |
|            |            |             |                     |
|   bedroom  |   castle   |   armory    |   dragon_treasury   |
|            |            |             |                     |
|____________|____________|_____________|_____________________|

> goto(bedroom).
You are located at bedroom
You can see : bed
Currently you have : maps, armor

> sleeping.
Have a good night O Tio, Knight in Shining Armor

> take(bed).
Tio took a bed and put it in his bag.

> sleeping.
You're in the bedroom, but there's no bed

> goto(armory).
You can't go there from here

> goto(castle).
You are located at castle
You can see : shield
Currently you have : bed, maps, armor

> take(shield).
Tio took a shield and put it in his bag.

> look.
You are located at castle
You can see : 
Currently you have : shield, bed, maps, armor

> goto(armory).
You are located at armory
You can see : desk, sword
Currently you have : shield, bed, maps, armor

> take(desk).
Tio took a desk and put it in his bag.

> look.
You are located at armory
You can see : sword
Currently you have : desk, bed, maps, shield, armor

> take(sword).
Tio took a sword and put it in his bag.

> look.
You are located at armory
You can see : 
Currently you have : sword, desk, bed, maps, shield, armor

> goto(dragon_treasury).
You are located at dragon_treasury
You can see : princess
Currently you have : sword, desk, bed, maps, shield, armor

> take(princess).
You can't take the princess because you don't have the requirements : sharp_sword, armor, shield

> sharpen(dodo).
It's not a sword.

> sharpen(sword).
Your sword is now sharp

> look.
You are located at dragon_treasury
You can see : princess
Currently you have : sharp_sword, desk, bed, maps, shield, armor

> take(princess).
Congratulations! Tio has found his true love <3

> quit.
Thanks for playing!
