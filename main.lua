Camera = require 'Camera'

function love.load()
	love.graphics.setDefaultFilter('nearest', 'nearest')
	Object = require 'classic'
	require 'map'
	require 'player'

	map = Map()
	player = Player()
	camera = Camera()
	camera:setFollowLerp(0.1)
	camera:setFollowStyle('TOPDOWN_TIGHT')
end


function love.update(dt)
	camera:update(dt)
	camera:follow(player.x, player.y)
	local newx = player.x
	local newy = player.y
	if (love.keyboard.isDown('right')) then
		newx = newx + 3
	elseif (love.keyboard.isDown('left')) then
		newx = newx - 3
	elseif (love.keyboard.isDown('up')) then
		newy = newy - 3
	elseif (love.keyboard.isDown('down')) then
		newy = newy + 3
	end

	local tile_x_1 = math.floor(newx / map.tile_width) + 1
	local tile_y_1 = math.floor(newy / map.tile_width) + 1
	local tile_x_2 = math.floor((newx + player.width) / map.tile_width) + 1
	local tile_y_2 = math.floor((newy + player.width) / map.tile_width) + 1

	if (tile_x_1 >= 1 and tile_x_1 <= 20 and tile_y_1 >= 1 and tile_y_1 <= 20 and
		tile_x_2 >= 1 and tile_x_2 <= 20 and tile_y_2 >= 1 and tile_y_2 <= 20 and
		map.map[tile_x_1][tile_y_1] == 0 and map.map[tile_x_2][tile_y_2] == 0 and 
		map.map[tile_x_1][tile_y_2] == 0 and map.map[tile_x_2][tile_y_1] == 0) then
		player.x = newx
		player.y = newy
	end

end


function love.draw()
	camera:attach()
	love.graphics.setBackgroundColor(255, 255, 255)
	map:draw()
    player:draw()
    camera:detach()
end

