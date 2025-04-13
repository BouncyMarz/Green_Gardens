extends CharacterBody2D
var in_area = []
var bodies = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	

func _on_attack_area_body_entered(body):
	if body.name == 'Enemy Body':
		in_area.append(body)
		while Glo.health > 0:
			if body in in_area:
				body.health -= 5
				await get_tree().create_timer(2).timeout
			else:
				break
	
				

func _on_attack_area_body_exited(body):
	if body.name == 'Enemy Body':
		in_area.erase(body)
	
