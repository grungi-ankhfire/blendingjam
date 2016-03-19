extends KinematicBody2D

const speed = 100
var inArea = false

func _ready():
	set_fixed_process(true)
	get_node("../StaticBody2D/Area2D").connect("body_enter",self,"_on_Area2D_body_enter")
	get_node("../StaticBody2D/Area2D").connect("body_exit",self,"_on_Area2D_body_exit")

func _fixed_process(delta):
	var direction = Vector2(0,0)
	if ( Input.is_action_pressed("ui_up") ):
		direction += Vector2(0,-1)
	if ( Input.is_action_pressed("ui_down") ):
		direction += Vector2(0,1)
	if (Input.is_action_pressed("ui_left")):
		direction += Vector2(-1,0)
	if (Input.is_action_pressed("ui_right")):
		direction += Vector2(1,0)
	
	move(direction * speed * delta)
	if is_colliding():
		var n = get_collision_normal()
		direction = n.slide(direction)
		move(direction*speed*delta)
		
	if inArea == true:
		if Input.is_key_pressed(KEY_SPACE):
			print("YO")

func _on_Area2D_body_enter(body):
	inArea = true

func _on_Area2D_body_exit(body):
	inArea = false
