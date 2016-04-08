
extends Label

# member variables here, example:
# var a=2
# var b="textvar"

var score = 0
var high_score = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	score = 0
	high_score = 0
	if Globals.has("SCORE") and Globals.has("TIMER"):
		score = Globals.get("SCORE") + 5 * Globals.get("TIMER")
	if Globals.has("HIGH_SCORE"):
		high_score = Globals.get("HIGH_SCORE")
	if score > high_score:
		Globals.set("HIGH_SCORE", score)
		high_score = score
	self.text = "Your score : " + str(score) + "\nHigh score : " + str(high_score)

