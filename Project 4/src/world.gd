extends Node2D
onready var line_container = $LineContainer
var lines = []
var itercount = 6

func _ready():
	
	var center = Vector2(get_viewport_rect().end.x / 2, get_viewport_rect().end.y / 2)
	var bottom_center = Vector2(get_viewport_rect().end.x / 2, get_viewport_rect().end.y)
	var bottom_right = Vector2(get_viewport_rect().end.x / 3 * 2, get_viewport_rect().end.y)
	
	lines = generate(bottom_center, itercount, 0.6, Color(1, 1, 1, 0.7), .5, FractalTree.new())
	
	
func _process(delta):
	
	if lines.empty():
		return
	var lines_per_frame = 25
	for index in lines_per_frame:
		line_container.add_child(lines.pop_front())	
		if lines.empty():
			break
			

func generate(start_position, iterations, length_red, color, width, rule):
	var length = -200
	var arrangement = rule.axiom
	for i in iterations:
		length *= length_red
		var new_arrangement = ""
		for character in arrangement:
			new_arrangement += rule.get_character(character)
		arrangement = new_arrangement

	
	var lines = []
	var from = start_position
	var rotate = 0
	var cache_queue = []
	for index in arrangement:
		match rule.get_action(index):
			"draw_forward":
				var to = from + Vector2(0, length).rotated(deg2rad(rotate))
				var line = Line2D.new()
				line.default_color = color
				line.width = width
				line.antialiased = true
				line.add_point(from)
				line.add_point(to)
				lines.push_back(line)
				from = to
			"rotate_right":
				rotate += rule.angle
			"rotate_left":
				rotate -= rule.angle
			"store":
				cache_queue.push_back([from, rotate])
			"load":
				var cached_data = cache_queue.pop_back()
				from = cached_data[0]
				rotate = cached_data[1]
	return lines


class Treee:
	var axiom
	var rules = {"F" : "FXAFYAFXBFYXFY"}
	var actions = {}
	var angle
	
	func get_character(character):
		if rules.has(character):
			return rules.get(character)
		return character
	
	func get_action(character):
		return actions.get(character)

class FractalTree extends Treee:
	
	func _init():
		self.axiom = "F"
		self.angle = 35
		self.actions = {
			"F" : "draw_forward",
			"A" : "rotate_right",
			"B" : "rotate_left",
			"X" : "store",
			"Y" : "load"
		}
