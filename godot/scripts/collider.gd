extends KinematicBody2D

const speed = 100
var inArea = false
var anim
var anime = "kill_"
var kill = null

var kill_timer = 3.0
var is_killing = false
var kill_target

var score = 0

var iamdead = false

func _ready():
	set_fixed_process(true)
	anim = get_node("./faucheuse/animator")
#	get_node("../StaticBody2D/Area2D").connect("body_enter",self,"_on_Area2D_body_enter")
#	get_node("../StaticBody2D/Area2D").connect("body_exit",self,"_on_Area2D_body_exit")
	get_node("../Label").set_text(str(score))

func _fixed_process(delta):
	if iamdead:
		return
	var direction = Vector2(0,0)
	if ( Input.is_action_pressed("ui_up") ):
		direction += Vector2(0,-1)
	if ( Input.is_action_pressed("ui_down") ):
		direction += Vector2(0,1)
	if (Input.is_action_pressed("ui_left")):
		direction += Vector2(-1,0)
	if (Input.is_action_pressed("ui_right")):
		direction += Vector2(1,0)
	
	if direction != Vector2(0,0):
		is_killing = false
	
	move(direction * speed * delta)
	if is_colliding():
		var n = get_collision_normal()
		direction = n.slide(direction)
		move(direction*speed*delta)
		


	if inArea == true:
		if Input.is_action_pressed("ui_up"):
			kill = "up"
		if Input.is_action_pressed("ui_down"):
			kill = "down"
		if Input.is_action_pressed("ui_left"):
			kill = "left"
		if Input.is_action_pressed("ui_right"):
			kill = "right"

		if Input.is_action_pressed("ui_accept"):
			anim.play(anime + kill)
			start_killing()

	# Killing stuff
	if is_killing:
		kill_timer -= delta
		if kill_timer < 0.0:
			kill_target.get_node("Area2D").kill(self)
			stop_killing()
			inArea = false

func start_killing():
	is_killing = true

func stop_killing():
	is_killing = false
	kill_timer = 3.0
	kill_target = null
	anim.play(kill)
#
#func _on_Area2D_body_enter(body):
#	inArea = true
#
#func _on_Area2D_body_exit(body):
#	inArea = false


func _on_nurse_body_enter( body ):
	if body == get_node(".") and not iamdead:
		iamdead = true
		anim.play("dead")
		set_fixed_process(false)
		Globals.set("TIMER", 0)
		get_node("./faucheuse").set_process(false)
		get_node("./faucheuse/playercontroller").set_process(false)


func _on_animator_finished():
	get_tree().change_scene("res://scenes/game_over.scn")
