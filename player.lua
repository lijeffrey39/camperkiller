Player = Object:extend()

function Player:new()
	self.x = 0
	self.y = 0
	self.player_image = love.graphics.newImage("player.png")
	self.width = 16
end

function Player:draw()
	love.graphics.draw(self.player_image, self.x, self.y, 0, 0.25)
	love.graphics.polygon('line', self.x, self.y, self.x, self.y + 16, self.x + 16, self.y + 16, self.x + 16, self.y)
end