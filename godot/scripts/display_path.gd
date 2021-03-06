extends Navigation2D
var path = []
var font = null
var drawTouch = false
var touchPos = Vector2(0,0)
var closestPos = Vector2(0,0)

var offset
var current_vector
var original_position

var interaction_timer

var cur_anim_direction = "down"
var animation_player
var target_bed

func _ready():
#	set_process_input(true)
	animation_player = get_node("IA agent/Sprite/AnimationPlayer")
	set_fixed_process(true)
	init_movement()

#func _draw():
#   if(path.size()):
#      for i in range(path.size()):
#         draw_string(font,Vector2(path[i].x,path[i].y - 20),str(i+1))
#         draw_circle(path[i],10,Color(1,0,0))
#      
#      if(drawTouch):
#         draw_circle(touchPos,10,Color(0,1,0))  
#         draw_circle(closestPos,10,Color(0,1,0))

func init_movement():
	interaction_timer = 0.0
	current_vector = null
	var destination = get_node("../IA targets").choose_destination()
	create_path(destination.get_pos())
	target_bed = destination.get_bed()

func _fixed_process(delta):
	if current_vector != null:
		var displacement = path[current_vector] - original_position
		var movement_length = displacement.length()
		var scaled_offset = (offset * movement_length) + delta * 200
		offset = scaled_offset / movement_length
		var new_pos = original_position + displacement*offset
		if offset >= 1:
			offset = 0
			new_pos = path[current_vector]
			original_position = new_pos
			if current_vector < path.size()-1:
				current_vector += 1
			else:
				current_vector = null
				interaction_timer = 1.0
				if target_bed.get_node("Area2D").is_dying:
					target_bed.get_node("Area2D").save_patient()
				animation_player.play("nurse_interaction")

		var distance = (new_pos-get_node("IA agent").get_pos()).length()
		var direction = (new_pos-get_node("IA agent").get_pos()).normalized()
		var node = get_node("IA agent")
		
		node.move(new_pos-get_node("IA agent").get_pos())
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0 and cur_anim_direction != "right":
				cur_anim_direction = "right"
				animation_player.play("nurse walking right")
			elif direction.x < 0 and cur_anim_direction != "left":
				cur_anim_direction = "left"
				animation_player.play("nurse walking left")
		else:
			if direction.y < 0 and cur_anim_direction != "up":
				cur_anim_direction = "up"
				animation_player.play("nurse walking up")
			elif direction.y > 0 and cur_anim_direction != "down":
				cur_anim_direction = "down"
				animation_player.play("nurse walking down")
		
		if node.is_colliding():
			var n = node.get_collision_normal()
			direction = n.slide( direction )
			node.move(direction*distance)
	elif interaction_timer > 0.0:
		interaction_timer -= delta
	else:
		cur_anim_direction = null
		init_movement()

func create_path(destination):
	path = get_simple_path(get_node("IA agent").get_pos(),destination)
	update()
	if path != null:
		offset = 0
		current_vector = 0
		original_position = get_node("IA agent").get_pos()

func _input(event):
	if(event.type == InputEvent.MOUSE_BUTTON):
		if(event.button_index == 1):
			touchPos = Vector2(event.x,event.y)
			drawTouch = true
			var destination = get_node("../IA targets").choose_destination()
			create_path(destination)
            
		if(event.button_index == 2):
			create_path(Vector2(event.x,event.y))
