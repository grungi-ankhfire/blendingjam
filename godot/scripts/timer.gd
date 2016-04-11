extends RichTextLabel

var count = 120

func _ready():
	self.add_text("120")

func _on_Timer_timeout():
	count -= 1
	self.clear()
	self.add_text(str(count))
	if count < 0:
		Globals.set("TIMER", 0)
		get_tree().change_scene("res://scenes/game_over.scn")
