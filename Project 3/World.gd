extends Node2D
var tile0 = preload("res://tile0.tscn")
var tile1 = preload("res://tile1.tscn")
var tile2 = preload("res://tile2.tscn")
var tile3 = preload("res://tile3.tscn")
var tile4 = preload("res://tile4.tscn")
var tile5 = preload("res://tile5.tscn")
var tile6 = preload("res://tile6.tscn")
var tile7 = preload("res://tile7.tscn")
var tile8 = preload("res://tile8.tscn")
var tile9 = preload("res://tile9.tscn")
var tile10 = preload("res://tile10.tscn")
var tile11 = preload("res://tile11.tscn")
var tile12 = preload("res://tile12.tscn")
var tile13 = preload("res://tile13.tscn")
var tile14 = preload("res://tile14.tscn")
var tile15 = preload("res://tile15.tscn")
var oce0 = preload("res://oce0.tscn")
var oce1 = preload("res://oce1.tscn")
var oce2 = preload("res://oce2.tscn")
var oce3 = preload("res://oce3.tscn")
var oce4 = preload("res://oce4.tscn")
var oce5 = preload("res://oce5.tscn")
var oce6 = preload("res://oce6.tscn")
var oce7 = preload("res://oce7.tscn")
var oce8 = preload("res://oce8.tscn")
var oce9 = preload("res://oce9.tscn")
var oce10 = preload("res://oce10.tscn")
var oce11 = preload("res://oce11.tscn")
var oce12 = preload("res://oce12.tscn")
var oce13 = preload("res://oce13.tscn")
var oce14 = preload("res://oce14.tscn")
var oce15 = preload("res://oce15.tscn")
const dir = [Vector2.RIGHT, Vector2.LEFT, Vector2.UP, Vector2.DOWN]

var grid_size = 243
var grid_spread = 4
var rock_chance = .5
var tile_chance = .5
var refine_iter = 16
var matrix = []
var height = []
var temp_matrix


func _ready():
	DS()
	CA()
	createHeight()

func CA():
	#OS.window_fullscreen = true
	randomize()
	for x in range(grid_size + 2):
		matrix.append([])
		for y in range(grid_size + 2):
			matrix[x].append(randi()%2)
	
	for z in range(refine_iter):
		refine_level()
	
	#create_level()

func DS():
	randomize()
	OS.window_fullscreen = true
	for x in range(grid_size):
		height.append([])
		for y in range(grid_size):
			height[x].append(8)
	height[0][0] = 6 + randi()%10
	height[0][grid_size - 1] = 6 + randi()%10
	height[grid_size - 1][0] = 6 + randi()%10
	height[grid_size - 1][grid_size - 1] = 6 + randi()%10
	DS_RECURSIVE(height[0][0], height[0][grid_size - 1], height[grid_size - 1][0], height[grid_size - 1][grid_size - 1], 0, 0, grid_size - 1, grid_size - 1, 8)
	

func DS_RECURSIVE(tl, tr, bl, br, boundt, boundl, boundb, boundr, rough):
	var boundct = int(ceil((boundt + boundb)/2))
	var boundcl = int(ceil((boundl + boundr)/2))
	var newrough = randi()%rough - int(ceil(rough * .3))
	var center = int(ceil((tl + tr + bl + br)/4) + newrough)
	if(center <= 0):
		center = 0
	if(center >= 15):
		center = 15
	rough = rough - 1
	height[boundcl][boundct] = center
	var left = 0
	var right = 0
	var up = 0
	var down = 0
	if( boundl - abs(boundl - boundcl) >= 0 && boundl - abs(boundl - boundcl) <= grid_size - 1):
		if(height[boundl - abs(boundl - boundcl)][boundct] == 8):
			left = int(ceil(( tl + bl + center ) /3))
		else:
			left = int(ceil(( tl + bl + center + height[boundl - abs(boundl - boundcl)][boundct]) /4))
	else:
		left = int(ceil(( tl + bl + center ) /3))
	height[boundl][boundct] = left + ((randi()%3 - 1) * randi()%3)
	if( boundt - abs(boundt - boundct) >= 0 && boundt - abs(boundt - boundct) <= grid_size - 1):
		if(height[boundcl][boundt + abs(boundt - boundct)] == 8):
			up = int(ceil(( tl + tr + center ) /3))
		else:
			up = int(ceil(( tl + tr + center + height[boundcl][boundt - abs(boundt - boundct)]) /4))
	else:
		up = int(ceil(( tl + tr + center ) /3))
	height[boundcl][boundt] = up + ((randi()%3 - 1) * randi()%3)
	if( (boundr + abs(boundl - boundcl)) >= 0 && (boundr + abs(boundl - boundcl)) <= grid_size - 1):
		if(height[boundr + abs(boundl - boundcl)][boundct] == 8):
			right = int(ceil(( tr + br + center ) /3))
		else:
			right = int(ceil(( tr + br + center + height[boundr][boundct]) /4))
	else:
		right = int(ceil(( tr + br + center ) /3))
	height[boundr][boundct] = right + ((randi()%3 - 1) * randi()%3)
	if( boundb + abs(boundt - boundct) >= 0 && boundb + abs(boundt - boundct) <= grid_size - 1):
		if(height[boundcl][boundb - abs(boundt - boundct)] == 8):
			down = int(ceil(( bl + br + center ) /3))
		else:
			down = int(ceil(( bl + br + center + height[boundcl][boundb + abs(boundt - boundct)]) /4))
	else:
		down = int(ceil(( bl + br + center ) /3))
	height[boundcl][boundb] = down + ((randi()%3 - 1) * randi()%3)
	if(abs(boundb - boundt) > 2):
		DS_RECURSIVE(left, center, bl, down, boundct, boundl, boundb, boundcl, rough)
		DS_RECURSIVE(center, right, down, br, boundct, boundcl, boundb, boundr, rough)
		DS_RECURSIVE(up, tr, center, right, boundt, boundcl, boundct, boundr, rough)
		DS_RECURSIVE(tl, up, left, center, boundt, boundl, boundct, boundcl, rough)
	
	
	
	#print(boundc, " ", boundc, " ", boundt, " ", boundc, " ", boundc, " ", boundl, " ", boundb, " ", boundc, " ", boundc, " ", boundr)
		
	#print(tl, " ", tr, " ", bl, " ", br, " ", center, " ", up, " ", left, " ", down, " ", right)

#int(ceil((( tl + tr + bl + br )/4) + newrough))
	

		

		
	#else:
		#print(height[boundt][boundl], " ",  height[boundt][boundl + 1], " ",  height[boundt][boundl + 2], " ",  height[boundt + 1][boundl], " ",  height[boundt + 1][boundl + 1], " ",  height[boundt + 1][boundl + 2], " ",  height[boundt + 2][boundl], " ",  height[boundt + 2][boundl + 1], " ",  height[boundt + 2][boundl + 2])
#		print(up, " ", left, " ", down, " ", right)
#		print(boundt, " ", boundl, " ", boundb, " ", boundr)


func createHeight():
	for x in range(1, grid_size - 1):
		for y in range(1, grid_size - 1):
			match matrix[x][y]:
				0:
					if(height[x][y] <= 1):
						var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
						var t = oce0.instance()
						t.position = current_pix
						add_child(t)
					match height[x][y]:
						2:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = oce1.instance()
							t.position = current_pix
							add_child(t)
						3:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = oce2.instance()
							t.position = current_pix
							add_child(t)
						4:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = oce3.instance()
							t.position = current_pix
							add_child(t)
						5:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = oce4.instance()
							t.position = current_pix
							add_child(t)
						6:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = oce5.instance()
							t.position = current_pix
							add_child(t)
						7:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = oce6.instance()
							t.position = current_pix
							add_child(t)
						8:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = oce7.instance()
							t.position = current_pix
							add_child(t)
						9:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = oce8.instance()
							t.position = current_pix
							add_child(t)
						10:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = oce9.instance()
							t.position = current_pix
							add_child(t)
						11:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = oce10.instance()
							t.position = current_pix
							add_child(t)
						12:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = oce11.instance()
							t.position = current_pix
							add_child(t)
						13:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = oce12.instance()
							t.position = current_pix
							add_child(t)
						14:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = oce13.instance()
							t.position = current_pix
							add_child(t)
						15:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = oce14.instance()
							t.position = current_pix
							add_child(t)
					if(height[x][y] >= 16.0):
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = oce15.instance()
							t.position = current_pix
							add_child(t)
				1:
					if(height[x][y] <= 1):
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = tile0.instance()
							t.position = current_pix
							add_child(t)
					match height[x][y]:
						2:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = tile1.instance()
							t.position = current_pix
							add_child(t)
						3:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = tile2.instance()
							t.position = current_pix
							add_child(t)
						4:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = tile3.instance()
							t.position = current_pix
							add_child(t)
						5:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = tile4.instance()
							t.position = current_pix
							add_child(t)
						6:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = tile5.instance()
							t.position = current_pix
							add_child(t)
						7:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = tile6.instance()
							t.position = current_pix
							add_child(t)
						8:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = tile7.instance()
							t.position = current_pix
							add_child(t)
						9:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = tile8.instance()
							t.position = current_pix
							add_child(t)
						10:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = tile9.instance()
							t.position = current_pix
							add_child(t)
						11:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = tile10.instance()
							t.position = current_pix
							add_child(t)
						12:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = tile11.instance()
							t.position = current_pix
							add_child(t)
						13:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = tile12.instance()
							t.position = current_pix
							add_child(t)
						14:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = tile13.instance()
							t.position = current_pix
							add_child(t)
						15:
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = tile14.instance()
							t.position = current_pix
							add_child(t)
					if(height[x][y] >= 16.0):
							var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
							var t = tile15.instance()
							t.position = current_pix
							add_child(t)

#func create_level():
#	for x in range(1, grid_size - 1):
#		for y in range(1, grid_size - 1):
#			match matrix[x][y]:
#				0:
#					var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
#					var t = tile.instance()
#					t.position = current_pix
#					add_child(t)
#				1:
#					var current_pix = Vector2(x - (grid_size * .5), y - (grid_size * .5)) * grid_spread
#					var t = rock.instance()
#					t.position = current_pix
#					add_child(t)
	
func refine_level():
	temp_matrix = matrix
	for x in range(grid_size + 1):
		for y in range(grid_size + 1):
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
