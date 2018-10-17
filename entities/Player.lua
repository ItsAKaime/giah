player = {
  x = 0,
  y = 0,
  tx = 0,
  ty = 0,
  speed = 4,
  canMove = true,
  vx = 0,
  vy = 0,
  sprid = 256,
  image = ts_image,
  cell = 8
}

function player:new(x, y)
  self.x = x * self.cell
  self.y = y * self.cell
  
  self.quad = setSpriteQuad(self.sprid)
  
  table.insert(entities, self)
end

function player:update(dt)
  camera:setPosition(self.x - canvas:getWidth()/2, self.y - canvas:getHeight()/2)
  if m:get(p.x + p.vx, p.y + p.vy) <= 3 or
     m:get(p.x + p.vx + self.cell - 1, p.y + p.vy) <= 4 or
     m:get(p.x + p.vx, p.y + p.vy + self.cell - 1) <= 4 or
     m:get(p.x + p.vx + self.cell - 1, p.y + p.vy + self.cell - 1) <= 3 then
      self.vx = 0
      self.vy = 0
      self.canMove = true
  end
  
  self.x = self.x + self.vx
  self.y = self.y + self.vy
end

function player:draw()
  love.graphics.draw(self.image, self.quad, self.x, self.y)
end

return player