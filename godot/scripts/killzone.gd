
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"

var player_node
var active = true

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	print(get_tree().get_root().get_children())
	player_node = get_tree().get_root().get_node("./Node2D/KinematicBody2D")
	connect("body_enter",self,"_on_Area2D_body_enter")
	connect("body_exit",self,"_on_Area2D_body_exit")

func kill():
	print("ARGH")
	get_node("../Normal").frame = 6
	active = false

func _on_Area2D_body_enter(body):
	if body == player_node and active:
		body.inArea = true
		body.kill_target = get_node('..')

func _on_Area2D_body_exit(body):
	if body == player_node and active:
		body.inArea = false
		body.kill_target = null

