fx_version 'bodacious'
game 'gta5'

client_script {
'@PolyZone/client.lua',
'@PolyZone/CircleZone.lua',
  '@PolyZone/BoxZone.lua',
  '@PolyZone/EntityZone.lua',
  '@PolyZone/CircleZone.lua',
  '@PolyZone/ComboZone.lua',
    'client/cl_*.lua',
    'cl_main.lua',
    'cl_aimblock',
    'cl_init.lua',
   'cl_sell.lua'

}
server_script 'server.lua'

shared_scripts { 
	'@qb-core/shared.lua'
}

files{
    'html/*'
}

ui_page('html/index.html')