extends Node2D
var draggable = false
var offset: Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			$"../Panel2".add_child(preload("res://tower.tscn").instantiate())
			offset = get_global_mouse_position() - global_position
			Glo.drag = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			Glo.drag = false
			$Area2D.input_pickable = false


func _on_area_2d_mouse_entered():
	if not Glo.drag:
		draggable = true
		scale = Vector2(1.01, 1.01)


func _on_area_2d_mouse_exited():
	if not Glo.drag:
		draggable = false
		scale = Vector2(1,1)
