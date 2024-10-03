fx_version 'cerulean'
games { 'gta5' }
author 'Edward'
ui_page {'html/index.html'}
client_scripts {
   'client.lua'
}
server_scripts{
   '@vrp/lib/utils.lua',
   'server.lua'
}

files {
   'html/*.*',
   'html/script.js'
}