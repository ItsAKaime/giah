function set_scene(scene)
  if scene.enter ~= nil then
    currentScene = scene
    currentScene:enter()
  end
end

function setSpriteQuad(index)
  return love.graphics.newQuad(
    (index % (ts_image:getWidth() / 8)) * 8,
    math.floor((index / (ts_image:getWidth() / 8)) % (ts_image:getHeight() / 8)) * 8,
    8,
    8,
    (ts_image:getWidth() / 8) * 8,
    (ts_image:getHeight() / 8) * 8
  )
end 