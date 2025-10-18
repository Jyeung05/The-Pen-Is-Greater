extends Node2D

var penArray: Array = []

var lines: Array = []


func _ready() -> void:
	penArray.append(self.get_child(0))
	penArray.append(self.get_child(1))
	penArray.append(self.get_child(2))

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pen1"):
		selection(1)
	elif Input.is_action_just_pressed("pen2"):
		selection(2)
	elif Input.is_action_just_pressed("pen3"):
		selection(3)
	elif Input.is_action_just_pressed("undo"):
		refund()
	

func selection(penNumber:int) -> void:
	for pen in penArray.size():
		if pen + 1 == penNumber:
			penArray[pen].select()
		else:
			penArray[pen].deselect()
func addToList(line:Line2D) -> void:
	self.lines.append(line)


func refund() -> void:
	if lines.size() == 0:
		return
	
	var nearest_line_index = -1
	var min_distance = INF
	
	# Find the nearest line to the mouse position
	for i in range(lines.size()):
		var line = lines[i]
		var distance = calculate_distance_to_line(get_global_mouse_position(), line)
		
		if distance < min_distance:
			min_distance = distance
			nearest_line_index = i
	
	# Remove the nearest line if it's close enough
	if nearest_line_index != -1 and min_distance < 20.0:  # 20 pixel threshold
		var line_to_remove = lines[nearest_line_index]
		lines.remove_at(nearest_line_index)
		
		line_to_remove.refund()  # Actually remove the Line2D node from the scene
func calculate_distance_to_line(point: Vector2, line: Line2D) -> float:
	var min_distance = INF
	
	# Check distance to each segment in the line
	for i in range(line.get_point_count() - 1):
		var segment_start = line.get_point_position(i)
		var segment_end = line.get_point_position(i + 1)
		
		var distance = calculate_distance_to_segment(point, segment_start, segment_end)
		min_distance = min(min_distance, distance)
	
	return min_distance

func calculate_distance_to_segment(point: Vector2, segment_start: Vector2, segment_end: Vector2) -> float:
	# Calculate the distance from a point to a line segment
	var line_vec = segment_end - segment_start
	var line_length_squared = line_vec.length_squared()
	
	if line_length_squared == 0:
		return point.distance_to(segment_start)
	
	var t = max(0, min(1, (point - segment_start).dot(line_vec) / line_length_squared))
	var projection = segment_start + t * line_vec
	return point.distance_to(projection)
