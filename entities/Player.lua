player = {
  x = 0,
  y = 0,
  tx = 0,
  ty = 0,
  m = nil,
  dir = {x = 1, y = 0},
  speed = 4,
  canMove = true,
  vx = 0,
  vy = 0,
  sprite = {
    [0] = love.graphics.newImage("res/s_player_r.png"),
    [1] = love.graphics.newImage("res/s_player_l.png")
  },
  flip = 0
}

function player:setDir(x,y)
  self.dir.x = x
  self.dir.y = y
end

function player:new(x, y)
  self.x = x * 16
  self.y = y * 16
  self.m = map
  
  table.insert(entities, self)
end

function player:update(dt)
  camera:lockPosition(p.x, p.y, Camera.smooth.damped(5))
  if m:get(p.x + p.vx, p.y + p.vy) == 2 or
     m:get(p.x + p.vx + 16 - 1, p.y + p.vy) == 2 or
     m:get(p.x + p.vx, p.y + p.vy + 16 - 1) == 2 or
     m:get(p.x + p.vx + 16 - 1, p.y + p.vy + 16 - 1) == 2 then
      self:setDir(0, 0)
      self.vx = 0
      self.vy = 0
      self.canMove = true
  end
  
  self.x = self.x + self.vx
  self.y = self.y + self.vy
end

function player:draw()
  love.graphics.draw(self.sprite[self.flip], self.x, self.y)
end

return player