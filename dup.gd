extends Node2D
@onready var map = $"../.."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_tower_dup():
	var instance = preload("res://tower.tscn").instantiate()
	map.add_child(instance)
