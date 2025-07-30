fx_version 'adamant'

game 'gta5'

lua54 'yes'
version '1.0.0'

shared_scripts { 
	'@es_extended/imports.lua',
	'@es_extended/locale.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'config.lua',
	'server.lua'
}

client_scripts {
	'config.lua',
	'client.lua',
}

dependencies {
    'ox_lib'
} 