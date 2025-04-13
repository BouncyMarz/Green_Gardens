extends Node2D
var SPEED = 0.03
# Called when the node enters the scene tree for the first time.
func _ready():
	self.progress_ratio = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.progress_ratio < 0.99:
		self.progress_ratio += delta * SPEED
	if $"Enemy Body".health > 0:
		$"Enemy Body/Sprite2D".play("default")
	else:
		$"Enemy Body/Sprite2D".stop()
