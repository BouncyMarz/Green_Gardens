extends Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = 'Health = ' + str(Glo.health) + '\n' + 'Money = $' + str(Glo.money)
