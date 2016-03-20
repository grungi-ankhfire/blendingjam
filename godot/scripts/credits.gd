
extends TextureButton

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func play():
	get_node("AnimationPlayer").play("credits")
	show()

func stop():
	hide()

func _on_Credits_scroll_pressed():
	stop()

func _on_Credits_pressed():
	play()
