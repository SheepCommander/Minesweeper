extends Node

var col := 10
var row := 10
var bombs := 10
var Tile : PackedScene = preload("res://tile.tscn")
var Tiles
@export var Tile_Width := 64

func settings(_col : int, _row : int, _bombs : int):
	col = _col
	row = _row
	bombs = _bombs

func _ready():
	randomize() # making the outcome diff each time game start

	#Creates the tiles	
	for c in col:
		for r in row:
			var Tile_Instance = Tile.instantiate()
			Tile_Instance.position = Vector2(c+1, r+1) * Tile_Width
			add_child(Tile_Instance)
	
	Tiles = get_children()
	
	set_bomb_position() #set bomb positions at start of game

func set_bomb_position():
	var i = 0
	while i < bombs:
		var tile = Tiles[randi() % len(Tiles)] #ran(0 ~ TilesNum)
		
		if tile.is_bomb == false: #Only count up if not bomb
			tile.set_bomb()
			i += 1
