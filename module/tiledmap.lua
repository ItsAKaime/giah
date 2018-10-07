function loadTiledMap(path)
  local map = require(path)
  
  map.quads = {}
  
  local tileset = map.tilesets[1]
  
  map.tileset = tileset
  map.image = love.graphics.newImage(tileset.image)
  
  for y = 0, (tileset.imageheight / tileset.tileheight) - 1 do
    for x = 0, (tileset.imagewidth / tileset.tilewidth) - 1 do
      local quad = love.graphics.newQuad(
        x * tileset.tilewidth,
        y * tileset.tileheight,
        tileset.tilewidth,
        tileset.tileheight,
        tileset.imagewidth,
        tileset.imageheight
      )
      table.insert(map.quads, quad)
    end
  end
  
  function map:draw()
    for i, layer in ipairs(self.layers) do
      for y = 0, layer.height - 1 do
        for x = 0, layer.width - 1 do
          local index = (x + y * layer.width) + 1
          local tid = layer.data[index]
          
          if tid ~= 0 then
            local quad = self.quads[tid]
            local xx = x * self.tileset.tilewidth
            local yy = y * self.tileset.tileheight
            
            love.graphics.draw(
              self.image,
              quad,
              xx,
              yy
            )
          end
        end
      end
    end
  end
  
  function map:get(x,y)
    return self.layers[1].data[(math.floor(x/self.tilewidth) + math.floor(y/self.tileheight) * self.layers[1].width) + 1]
  end
  
  function map:findSpawn(id)
    local pos = {}
    for yy = 0, self.layers[2].height do
      for xx = 0, self.layers[2].width do
        if self.layers[2].data[xx + yy * self.layers[2].width] == id then
          pos.x = xx
          pos.y = yy
        end
      end
    end
    
    return pos
  end
  
  return map
end