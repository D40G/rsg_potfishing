fx_version 'cerulean'
game 'gta5'

description 'Rexshack Gaming : Pot Fishing'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
	'client/client.lua',
	'client/menus.lua',
	'client/npcs.lua',
}

server_scripts {
	'server/server.lua',
}

shared_scripts {
	'config.lua',
}