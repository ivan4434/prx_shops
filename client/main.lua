local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

PRX = nil
local lastMarkerCoords = {}
local plyaCoords = GetEntityCoords(PlayerPedId())

TriggerEvent('esx:getSharedObject', function(obj) PRX = obj end)

CreateThread(function()
  while true do
    Wait(2500)
    plyaCoords = GetEntityCoords(PlayerPedId())
    for k, v in pairs(Config.Place) do
      for i = 1, #v.Pos, 1 do
        local dist = Vdist(plyaCoords.x, plyaCoords.y, plyaCoords.z, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z + 1.0)
        while dist < 10.0 do
          Wait(0)
          DrawMarker(1, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, 0, 0, 0, 0, 0, 0, v.Markers.sizeX, v.Markers.sizeY, v.Markers.sizeZ, v.Markers.color.r, v.Markers.color.g, v.Markers.color.b, 200, 0, 0, 0, 0)
          plyaCoords = GetEntityCoords(PlayerPedId())
          dist = Vdist(plyaCoords.x, plyaCoords.y, plyaCoords.z, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z + 1.0)
          if dist < 1.0 then
            if Config.UsePRXNotifications == true then
              HasEnteredMarker(dist, 'Pulsa ~INPUT_CONTEXT~ para acceder a la ~r~Tienda')
              lastMarkerCoords = {x=v.Pos[i].x, y=v.Pos[i].y, z=v.Pos[i].z}
            else
              PRX.ShowHelpNotification('Pulsa ~INPUT_CONTEXT~ para acceder a la ~r~Tienda')
            end

          elseif Config.UsePRXNotifications == true then
            HasExitedMarker()
          end

          if IsControlJustPressed(0, Keys['E']) and dist < 1.0 then
            local shop = k
            AbrirTienda(shop)
          end
        end
      end
    end
  end
end)

function HasEnteredMarker(dist, text)
  if dist < 1.0 then
    PRX.ShowAlerta(text, true)
  end
end

function HasExitedMarker()
  if (Vdist(plyaCoords.x, plyaCoords.y, plyaCoords.z, lastMarkerCoords.x, lastMarkerCoords.y, lastMarkerCoords.z)) > 1.5 then
     PRX.ShowAlerta('', false)
  end
end

CreateThread(function()
  for k,v in pairs(Config.Place) do
    for i = 1, #v.Pos, 1 do
      local nuevaBlip = AddBlipForCoord(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
      SetBlipSprite(nuevaBlip, v.Blips.id)
      SetBlipDisplay(nuevaBlip, 4)
      SetBlipScale(nuevaBlip, v.Blips.scale)
      SetBlipColour(nuevaBlip, v.Blips.color)
      SetBlipAsShortRange(nuevaBlip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(v.Blips.name)
      EndTextCommandSetBlipName(nuevaBlip)
    end
  end
end)

function AbrirTienda(tienda)
  local elements = {}
  for i = 1, #Config.Place[tienda].Items, 1 do
    local valor
    if Config.Place[tienda].Items[i].isGun == true then valor = nil else valor = 'slider'end
    table.insert(elements,{label = Config.Place[tienda].Items[i].label..' - <span style="color:green;">'..Config.Place[tienda].Items[i].price..'€</span>', item = Config.Place[tienda].Items[i].item, price = Config.Place[tienda].Items[i].price, type = valor, value = 1, min = 1, max = 255})
  

  PRX.UI.Menu.CloseAll()
  PRX.UI.Menu.Open( 'default', GetCurrentResourceName(), 'shop', -- Replace the menu name
  {
    title    = ('Tienda'),
    align = 'bottom-right', -- Menu position
    elements = elements
  },
  function(data, menu) -- This part contains the code that executes when you press enter
    local texto = string.gsub(data.current.label, ' - <span style="color:green;">'..data.current.price..'€</span>', "")
    NumItem(data.current.item, data.current.price, data.current.value,  Config.Place[tienda].Items[i].isGun, texto)
  end,
  function(data, menu) -- This part contains the code  that executes when the return key is pressed.
      menu.close() -- Close the menu
  end

)
end
end

function NumItem(item, price, value, weapon, label)
  PRX.UI.Menu.CloseAll()
  PRX.UI.Menu.Open( 'default', GetCurrentResourceName(), 'confirm', -- Replace the menu name
    {
      title    = ('Seguro que quieres comprar '..value..' '..label..' por '..'<span style="color:green;">'..price*value..'€</span>'),
      align = 'bottom-right', -- Menu position
      elements = { -- Contains menu elements
        {label = ('Si'),     value = 'si'},
        {label = ('No'),      value = 'no'}
      }
    },
    function(data, menu) -- This part contains the code that executes when you press enter
      if data.current.value == 'si' then
        menu.close()
        if weapon == false then
          TriggerServerEvent('prx_shops:buyItem', item, value, price, label)
        else
          TriggerServerEvent('prx_shops:buyGun', item, value, price, label)
        end
      end
      if data.current.value == 'no' then
        menu.close()
      end   
    end,
    function(data, menu) -- This part contains the code  that executes when the return key is pressed.
        menu.close() -- Close the menu
    end
  )
end