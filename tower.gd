extends CharacterBody2D
var in_area = []
var bodies = false
var draggable = false
var offset: Vector2
@onready var map = $".."
var child = preload("res://tower.tscn")
signal dup
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if draggable and Glo.money >= 10:
		if Input.is_action_just_pressed("click"):
			emit_signal('dup')
			offset = get_global_mouse_position() - global_position
			Glo.drag = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			Glo.drag = false
			$"Attack Area".input_pickable = false


func _on_attack_area_body_entered(body):
	if body.name == 'Enemy Body':
		in_area.append(body)
		while Glo.health > 0:
			if body in in_area:
				body.health -= 5
				Glo.money += 2
				await get_tree().create_timer(2).timeout
			else:
				break
	
				

func _on_attack_area_body_exited(body):
	if body.name == 'Enemy Body':
		in_area.erase(body)
	


func _on_attack_area_mouse_entered():
	if not Glo.drag:
		draggable = true
		scale = Vector2(1.01, 1.01)



func _on_attack_area_mouse_exited():
	if not Glo.drag:
		draggable = false
		scale = Vector2(1,1)


