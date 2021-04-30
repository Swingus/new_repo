extends Node2D
var tile = preload("res://Tile.tscn")
var rock = preload("res://Rock.tscn")
const dir = [Vector2.RIGHT, Vector2.LEFT, Vector2.UP, Vector2.DOWN]

var grid_size = 64
var grid_spread = 16
var rock_chance = .5
var tile_chance = .5
var refine_iter = 16
var matrix = []
var temp_matrix


func _ready():
	OS.window_fullscreen = true
	randomize()
	for x in range(grid_size):
		matrix.append([])
		for y in range(grid_size):
			matrix[x].append(randi()%2)
	
	for z in range(refine_iter):
		refine_level()
	
	create_level()






func create_level():
	for x in range(1, grid_size - 1):
		for y in range(1, grid_size - 1):
			match matrix[x][y]:
				0:
					var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
					var t = tile.instance()
					t.position = current_pix
					add_child(t)
				1:
					var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
					var t = rock.instance()
					t.position = current_pix
					add_child(t)
	
func refine_level():
	temp_matrix = matrix
	for x in range(grid_size):
		for y in range(grid_size):
			match matrix[x][y]:
				0:
					var ncounter = 0
					if(x != 0 and y != 0 and x != grid_size -1 and y != grid_size -1):
						if(temp_matrix[x - 1][y - 1] != matrix[x][y]):
							ncounter += 1
						if(temp_matrix[x][y - 1] != matrix[x][y]):
							ncounter += 1
						if(temp_matrix[x + 1][y - 1] != matrix[x][y]):
							ncounter += 1
						if(temp_matrix[x - 1][y] != matrix[x][y]):
							ncounter += 1
						if(temp_matrix[x + 1][y] != matrix[x][y]):
							ncounter += 1
						if(temp_matrix[x - 1][y + 1] != matrix[x][y]):
							ncounter += 1
						if(temp_matrix[x][y + 1] != matrix[x][y]):
							ncounter += 1
						if(temp_matrix[x + 1][y + 1] != matrix[x][y]):
							ncounter += 1
						if(ncounter > 4):
							matrix[x][y] = 1
				1:
					var ncounter = 0
					if(x != 0 and y != 0 and x != grid_size -1 and y != grid_size -1):
						if(temp_matrix[x - 1][y - 1] != matrix[x][y]):
							ncounter += 1
						if(temp_matrix[x][y - 1] != matrix[x][y]):
							ncounter += 1
						if(temp_matrix[x + 1][y - 1] != matrix[x][y]):
							ncounter += 1
						if(temp_matrix[x - 1][y] != matrix[x][y]):
							ncounter += 1
						if(temp_matrix[x + 1][y] != matrix[x][y]):
							ncounter += 1
						if(temp_matrix[x - 1][y + 1] != matrix[x][y]):
							ncounter += 1
						if(temp_matrix[x][y + 1] != matrix[x][y]):
							ncounter += 1
						if(temp_matrix[x + 1][y + 1] != matrix[x][y]):
							ncounter += 1
						if(ncounter > 4):
							matrix[x][y] = 0
