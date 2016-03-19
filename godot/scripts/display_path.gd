extends Navigation2D
var path = []
var font = null
var drawTouch = false
var touchPos = Vector2(0,0)
var closestPos = Vector2(0,0)

var offset
var current_vector
var original_position

func _ready():
	set_process_input(true)
	set_fixed_process(true)

func _draw():
   if(path.size()):
      for i in range(path.size()):
#         draw_string(font,Vector2(path[i].x,path[i].y - 20),str(i+1))
         draw_circle(path[i],10,Color(1,1,1))
      
      if(drawTouch):
         draw_circle(touchPos,10,Color(0,1,0))  
         draw_circle(closestPos,10,Color(0,1,0))

func _fixed_process(delta):
	if current_vector != null:
		var displacement = path[current_vector] - original_position
		var movement_length = displacement.length()
		var scaled_offset = (offset * movement_length) + delta * 100
		offset = scaled_offset / movement_length
		var new_pos = original_position + displacement*offset
		print(offset)
		if offset >= 1:
			offset = 0
			new_pos = path[current_vector]
			original_position = new_pos
			if current_vector < path.size()-1:
				current_vector += 1
			else:
				current_vector = null
			
		get_node("IA agent").set_pos(new_pos)

func _input(event):
	if(event.type == InputEvent.MOUSE_BUTTON):
		if(event.button_index == 1):
			print ("Mouse pressed")
			if(path.size()):
				touchPos = Vector2(event.x,event.y)
				drawTouch = true
				closestPos = get_closest_point(touchPos)
				print("Drawing touch")
				update()
            
		if(event.button_index == 2):
			path = get_simple_path(get_node("IA agent").get_pos(),Vector2(event.x,event.y))
			update()
			for v in path:
				print(v)
			if path != null:
				offset = 0
				current_vector = 0
				original_position = get_node("IA agent").get_pos()
