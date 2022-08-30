Config = {}

Config.CrayfishPrice = 25 -- sell price per crayfish
Config.CrabPrice = 50 -- sell price per crab
Config.LobsterPrice = 100 -- sell price per lobster
Config.RebaitPrice = 10 -- cost associated with rebaiting each pot

Config.FishingZone = { -- fishing zones
    [1] = {
        zones = { -- bronzezone
			vector2(-1615.8869628906, -2020.8880615234),
			vector2(-2077.8359375, -2458.9548339844),
			vector2(-2865.7302246094, -918.26019287109),
			vector2(-2386.384765625, -743.73193359375)
        },
		name = "bronzezone",
		--minZ = 3.2381904125214,
		--maxZ = 25.422334671021
    },
    [2] = {
        zones = { -- silver
			vector2(-1653.2348632812, 5821.5327148438),
			vector2(-261.29077148438, 7182.2885742188),
			vector2(-738.19134521484, 7770.673828125),
			vector2(-2406.6472167969, 6223.146484375)
        },
		name = "sliverzone",
		--minZ = -0.57804691791534,
		--maxZ = 1.6441655158997
    },
    [3] = {
        zones = { -- goldzone
			vector2(3874.7963867188, -4862.9252929688),
			vector2(4346.9873046875, -4685.4814453125),
			vector2(4632.154296875, -5838.029296875),
			vector2(3679.2534179688, -6243.146484375)
        },
		name = "bronzezone",
		--minZ = -0.57804691791534,
		--maxZ = 1.6441655158997
    },
    [4] = {
        zones = { -- crayfishzone
			vector2(-1756.8071289062, 2627.8256835938),
			vector2(-1791.3541259766, 2621.1760253906),
			vector2(-1814.6398925781, 2607.9887695312),
			vector2(-1843.3958740234, 2602.5263671875),
			vector2(-1860.3074951172, 2608.7595214844),
			vector2(-1884.9504394531, 2588.4296875),
			vector2(-1928.8404541016, 2581.6687011719),
			vector2(-1966.3494873047, 2559.6833496094),
			vector2(-2017.8181152344, 2549.68359375),
			vector2(-2075.3598632812, 2590.2358398438),
			vector2(-2165.7692871094, 2621.0461425781),
			vector2(-2270.4135742188, 2635.3342285156),
			vector2(-2313.6791992188, 2565.046875),
			vector2(-2265.9291992188, 2589.8481445312),
			vector2(-2221.8334960938, 2587.0290527344),
			vector2(-2153.0471191406, 2583.2407226562),
			vector2(-2117.9621582031, 2579.8391113281),
			vector2(-2079.3732910156, 2553.4860839844),
			vector2(-2040.0711669922, 2524.9367675781),
			vector2(-1990.7294921875, 2540.0129394531),
			vector2(-1974.9840087891, 2533.46484375),
			vector2(-1956.2932128906, 2550.2087402344),
			vector2(-1914.3094482422, 2566.8071289062),
			vector2(-1869.2470703125, 2563.9086914062),
			vector2(-1835.833984375, 2579.05078125),
			vector2(-1790.8524169922, 2576.8564453125),
			vector2(-1765.4248046875, 2598.2336425781)
        },
		name = "crayfishzone",
		--minZ = 1.3055044412613,
		--maxZ = 3.896500825882
    },
    [5] = {
        zones = { -- goldzone
			vector2(3180.3049316406, 1166.7738037109),
			vector2(3437.2028808594, 1910.3760986328),
			vector2(3680.5571289062, 1825.8975830078),
			vector2(3563.291015625, 952.09539794922)
        },
		name = "goldzone",
		--minZ = -0.57804691791534,
		--maxZ = 1.6441655158997
    },
}

-- NPC SETTINGS --

Config.Invincible = true -- Is the ped going to be invincible?
Config.Frozen = true -- Is the ped frozen in place?
Config.Stoic = true -- Will the ped react to events around them?
Config.FadeIn = true -- Will the ped fade in and out based on the distance. (Looks a lot better.)
Config.DistanceSpawn = 20.0 -- Distance before spawning/despawning the ped. (GTA Units.)

Config.MinusOne = true -- Leave this enabled if your coordinates grabber does not -1 from the player coords.

Config.GenderNumbers = { -- No reason to touch these.
	['male'] = 4,
	['female'] = 5
}

Config.FishingPedList = { -- ped used to start the weedrun

	{
        model = `s_m_m_dockwork_01`,
        coords = vector4(-753.4568, -1512.305, 5.0197486, 22.727573),
        gender = 'male',
        scenario = 'WORLD_HUMAN_CLIPBOARD'
    },

}

-- Fishing Vendor
Config.FishingVendor = {

	[1] = {
		name = 'fishingpot',
		price = 100,
		amount = 500,
		info = {},
		type = 'item',
		slot = 1,
	},
	
}