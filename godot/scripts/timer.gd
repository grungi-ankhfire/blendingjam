extends RichTextLabel

var count = 180

func _ready():
	self.add_text("180")

func _on_Timer_timeout():
	count -= 1
	self.clear()
	self.add_text(str(count))
	if count < 0:
		get_tree().change_scene("res://scenes/game_over.scn")
