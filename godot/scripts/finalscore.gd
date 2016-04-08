
extends Label

# member variables here, example:
# var a=2
# var b="textvar"

var score = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	score = Globals.get("SCORE") + 5 * Globals.get("TIMER")
	self.text = "Your score : " + str(score)

