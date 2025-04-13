extends AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Glo.health <= 100 and Glo.health >= 51:
		self.frame = 0
	elif Glo.health <= 50 and Glo.health > 0:
		self.frame = 1
	elif Glo.health <= 0:
		self.frame = 2
