
extends Node

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	set_process(true)
	
func _process (deltatime):
	if Input.is_key_pressed(KEY_LEFT):
		print ("A gauche")
	if Input.is_key_pressed(KEY_RIGHT):
		print ("A droite")
	if Input.is_key_pressed(KEY_UP):
		print ("En haut")
	if Input.is_key_pressed(KEY_DOWN):
		print ("En bas")
	
	


