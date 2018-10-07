p = require "entities.player"
Camera = require "module.hump.camera"
game = {}

-- Scene Variables
entities = {}
currentZone = "dungeon"

function game:enter()
  m = loadTiledMap("res/zones/"..currentZone)
  pspawn = m:findSpawn(4)
  
  p:new(pspawn.x-1,pspawn.y)
  camera = Camera(p.x, p.y, 5)
end

function game:update(dt)
  for _, entity in ipairs(entities) do
    entity:update()
  end
end

function game:draw()
  screen(function ()
    camera:attach()
    
    m:draw()
  
    for _, entity in ipairs(entities) do
      entity:draw()
    end

    camera:detach()
  end)
end

function game:keypressed(key)
  if key == "escape" then love.event.quit() end
  if p.canMove == true and key == "right" or key == "d" then
    p:setDir(1, 0)
    p.flip = 0
    p.vx = p.vx + p.speed
    p.canMove = false
  elseif p.canMove == true and key == "left" or key == "a" then
    p:setDir(-1, 0)
    p.flip = 1
    p.vx = p.vx - p.speed
    p.canMove = false
  elseif p.canMove == true and key == "up" or key == "w" then
    p:setDir(-1, 0)
    p.vy = p.vy - p.speed
    p.canMove = false
  elseif p.canMove == true and key == "down" or key == "s" then
    p:setDir(1, 0)
    p.vy = p.vy + p.speed
    p.canMove = false
  end
end

return game