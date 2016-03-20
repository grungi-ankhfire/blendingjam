
extends KinematicBody2D

# member variables here, example:
# var a=2
# var b="textvar"
var nurse_anime

	# Initialization here
func _ready():
	nurse_anime = get_node("./Sprite/AnimationPlayer")
	
func _fixed_process(delta):
	if is_colliding():
		var collide = get_collider()
		print(collide)

func _on_Area2D_body_enter( body ):
	nurse_anime.play("nurse_interaction")
	pass # replace with function body