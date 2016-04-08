
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"

var player_node
var active = true


var realdeath_timer
var is_dying = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	print(get_tree().get_root().get_children())
	player_node = get_tree().get_root().get_node("./Node2D/KinematicBody2D")
	connect("body_enter",self,"_on_Area2D_body_enter")
	connect("body_exit",self,"_on_Area2D_body_exit")

func _fixed_process(delta):
	if is_dying:
		realdeath_timer -= delta
		if realdeath_timer < 0.0:
			get_node("../Normal").frame = 7
			player_node.score += 1
			player_node.get_node("../Label").set_text(str(player_node.score))
			is_dying = false
			get_tree().get_root().get_node("./Node2D/Level/IA targets").remove_active(self)

func save_patient():
	get_node("../Normal").frame = 5
	is_dying = false
	realdeath_timer = 0.0
	active = true

func kill(character):
	get_node("../Normal").frame = 6
	realdeath_timer = 3.0
	is_dying = true
	active = false

func _on_Area2D_body_enter(body):
	if body == player_node and active:
		body.inArea = true
		body.kill_target = get_node('..')

func _on_Area2D_body_exit(body):
	if body == player_node and active:
		body.inArea = false
		if body.kill_target != null:
			body.kill_target
		body.kill_target = null

