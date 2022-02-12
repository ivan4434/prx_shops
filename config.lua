Config = {}

Config.DrawDistance = 10

Config.UsePRXNotifications = false

Config.Place = {
	Badulaque = {
		Blips = {name="24/7",color=0, id=59, scale = 1.0},
		Markers = {sizeX =1.001, sizeY = 1.0001, sizeZ = 0.1, color = {r = 0, g= 0, b = 0}},
		
		Items = {
			{label = 'Pan', item = 'bread', price = 10, isGun = false},
			{label = 'Agua', item = 'water', price = 5, isGun = false},
			{label = 'Cigarro', item = 'cigarro', price = 5, isGun = false},
			{label = 'Mechero', item = 'mechero', price = 5, isGun = false},
			{label = 'Móvil', item = 'phone', price = 600, isGun = false}
		},
		Pos = {
			{x = 373.875,   y = 325.896,  z = 102.566},
        	{x = 2557.458,  y = 382.282,  z = 107.622},
        	{x = -3038.939, y = 585.954,  z = 6.908},
        	{x = -3241.927, y = 1001.462, z = 11.830},
        	{x = 547.431,   y = 2671.710, z = 41.156},
        	{x = 1961.464,  y = 3740.672, z = 31.343},
        	{x = 2678.916,  y = 3280.671, z = 54.241},
        	{x = 1729.216,  y = 6414.131, z = 34.037},
        	{x = -949.14,  y = -170.8, z = 46.27},
        	{x = 1135.808,  y = -982.281,  z = 45.415},
        	{x = -1222.915, y = -906.983,  z = 11.326},
        	{x = -1487.553, y = -379.107,  z = 39.163},
        	{x = -2968.243, y = 390.910,   z = 14.043},
        	{x = 1166.024,  y = 2708.930,  z = 37.157},
        	{x = 1392.562,  y = 3604.684,  z = 33.980},
        	{x = -48.519,   y = -1757.514, z = 28.421},
        	{x = 1163.373,  y = -323.801,  z = 68.205},
        	{x = -707.501,  y = -914.260,  z = 18.215},
        	{x = -1820.523, y = 792.518,   z = 137.118},
        	{x = 1698.388,  y = 4924.404,  z = 41.063},
          --	{x = 4468.04,  y = -4465.69,  z = 4.25},
         	--{x = 5153.33,   y = -5126.28,  z = 2.27},
			 {x = 26.38,   y = -1346.28,  z = 28.5},
			-- {x = 1760.15,   y = 2480.62,  z = 44.59}
          
    	},
	},

	--[[Bares = {
		Blips = {name="Bar",color=0, id=93},
		Markers = {sizeX =1.001, sizeY = 1.0001, sizeZ = 0.5001, color = {r = 0, g= 170, b = 255}},
		Items = {
			{label = 'Agua', item = 'water', price = 5, isGun = false},
			{label = 'Cerveza', item = 'beer', price = 10, isGun = false},

		},
		Pos = {
			{x = 1986.32,   y = 3053.99, z = 47.22}, --Yellow
        	{x = -558.95,   y = 286.41, z = 82.18}, --Tequila
        	{x = -13.99,   y = 239.59, z = 109.55}, -- Galaxy
          
    	},
	},]]

	AmmuNation = {
		Blips = {name="Ammu-Nation",color=0, id=110, scale = 1.0},
		Markers = {sizeX =1.001, sizeY = 1.0001, sizeZ = 0.1, color = {r = 0, g= 0, b = 0}},
		Items = {
			{label = 'Cuchillo', item = 'weapon_knife', price = 1000, isGun = true},
			{label = 'Bate', item = 'weapon_bat', price = 500, isGun = true}

		},
		Pos = {
			{x=-662.1, y=-935.3, z=20.8},
			{x=810.2, y=-2157.3, z=28.6},
			{x=1693.4, y=3759.5, z=33.7},
			{x=-330.2, y=6083.8, z=30.4},
			{x=252.3, y=-50.0, z=68.9},
			{x=22.0, y=-1107.2, z=28.8},
			{x=2567.6, y=294.3, z=107.7},
			{x=-1117.5, y=2698.6, z=17.5},
			{x=842.4, y=-1033.4, z=27.1}
          
    	}
	},

	Mafia = {
		Blips = {name="Ammu-Nation",color=0, id=110, scale = 0.0},
		Markers = {sizeX =1.001, sizeY = 1.0001, sizeZ = 0.1, color = {r = 0, g= 0, b = 0}},
		Items = {
			{label = 'Cuchillo', item = 'weapon_knife', price = 0, isGun = true},
			{label = 'Fleca y Banco Central - Tarjeta de Identificación', item = 'id_card', price = 0, isGun = false},
			{label = 'Flecaa - Tarjeta de Identificación Falsa', item = 'id_card_f', price = 0, isGun = false},
			{label = 'Banco Central - Portatil sin IP', item = 'laptop_h', price = 0, isGun = false},
			{label = 'Banco Central, Fleecaa y Robar casas - Ganzúa', item = 'lockpick', price = 0, isGun = false},
			{label = 'Banco Central - Carga Térmica', item = 'thermal_charge', price = 0, isGun = false},
			{label = 'Ganzua Para Coches', item = 'ganzua', price = 0, isGun = false}
		},
		Pos = {
			{x=-1475.66, y=-35.26, z=56.89}
          
    	}
	},


	Carcel = {
		Blips = {name="24/7",color=0, id=59, scale = 0.0},
		Markers = {sizeX =1.001, sizeY = 1.0001, sizeZ = 0.1, color = {r = 0, g= 0, b = 0}},
		
		Items = {
			{label = 'Pan', item = 'bread', price = 10, isGun = false},
			{label = 'Agua', item = 'water', price = 5, isGun = false},
			{label = 'Cigarro', item = 'cigarro', price = 5, isGun = false},
			{label = 'Mechero', item = 'mechero', price = 5, isGun = false},
		},
		Pos = {
			 {x = 1760.15,   y = 2480.62,  z = 44.59}
          
    	},
	},
	
}


