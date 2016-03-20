
extends KinematicBody2D

# member variables here, example:
# var a=2
# var b="textvar"
var nurse_anime


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	nurse_anime = get_node("./Sprite/AnimationPlayer")

func _on_Area2D_body_enter( body ):
	nurse_anime.play("nurse_interaction")
	pass # replace with function body