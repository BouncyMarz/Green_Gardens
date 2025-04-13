extends Node2D
var SPEED = 0.2
var enemy = preload("res://enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(10):
		await get_tree().create_timer(3).timeout
		$Path2D.add_child(enemy.instantiate())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_area_2d_body_entered(body):
	if body.name == 'Enemy Body':
		Glo.health -= 10
		await get_tree().create_timer(0.3).timeout
		body.queue_free()


func _on_tower_dup():
	var instance = preload("res://tower.tscn").instantiate()
	$Panel2.add_child(instance)
