extends Node2D
var tile = preload("res://Tile.tscn")
var entrance = preload("res://Entrance.tscn")
var exit = preload("res://Exit.tscn")
const dir = [Vector2.RIGHT, Vector2.LEFT, Vector2.UP, Vector2.DOWN]

var grid_size = 16
var grid_spread = 16
var grid_steps = 120
var mu = 2
var index_val = 0
var index_tot = 0
var grid = []
var grid_container = []

func _ready():
	for i in range(1, (mu * 2 + 1)):
		randomize()
		create_level()
		if index_val > (index_tot / i):
			grid_container.push_front(grid)
		#grid.clear()
		index_tot += index_val
	var last = grid_container[0]
	var f = last[0]
	var b = last[last.size() - 1]
	for i in range(0, last.size()):
		var t = tile.instance()
		t.position = last[i]
		add_child(t)
	var u = entrance.instance()
	u.position = last[0]
	add_child(u)
	var v = exit.instance()
	v.position = b
	add_child(v)





func create_level():
	var current_pix = Vector2(0, 0)
	var current_pos = Vector2(0, 0)
	
	var current_dir = Vector2.RIGHT
	var last_dir = current_dir * -1
	
	for i in range(0, grid_steps):
		var temp_dir = dir.duplicate()
		temp_dir.shuffle()
		var d = temp_dir.pop_front()
		var entr = current_pix
		var ext = current_pix
		while(abs(current_pos.x + d.x) > grid_size or abs(current_pos.y + d.y) > grid_size or d == last_dir * -1 or (current_pos.x + d.x == entr.x and current_pos.y + d.y == entr.y)):
			temp_dir.shuffle()
			d = temp_dir.pop_front()
		current_pos += d
		current_pix += d * grid_spread
		last_dir = d
		if(i == 0):
			#var t = tile.instance()
			var t = current_pix
			#add_child(t)
			grid.append(t)
			entr = t / grid_size
		elif(i == grid_steps - 1):
			#var t = exit.instance()
			var t = current_pix
			#add_child(t)
			grid.append(t)
			ext = current_pix
			t = entr
			#t = entrance.instance()
			#add_child(t)
			index_val = abs((ext.x + entr.x) / grid_spread) + abs((ext.y + entr.y) / grid_spread)
		else:
			#var t = tile.instance()
			var t = current_pix
			#add_child(t)
			grid.append(t)
