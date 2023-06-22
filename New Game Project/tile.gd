extends Node2D

var is_cover = true
var flagged = false
var is_bomb = false


func _ready():
#	$Label.hide()
	$Bomb.hide()
	$Back.show()
	$Cover.show()
	$Flag.hide()


func set_bomb():
	is_bomb = true
	$Label.hide()
	$Bomb.show()


func uncover():
	if flagged == false:
		$Cover.hide()
		is_cover = false
		var count_surrounds = 0
		for tile in get_surrounds():
			if tile.is_bomb:
				count_surrounds += 1
		
		if count_surrounds > 0:
			$Label.text = str(count_surrounds)
		else:
			for tile in get_surrounds():
				if tile.is_cover:
					tile.uncover()


func get_surrounds():
	var surrounds = []
	# getting all possible positions for the tiles
	var offsets = [
		(Vector2.UP + Vector2.LEFT) * 64,
		(Vector2.UP) * 64,
		(Vector2.UP + Vector2.RIGHT) * 64,
		Vector2.LEFT * 64,
		Vector2.RIGHT * 64,
		(Vector2.DOWN + Vector2.LEFT) * 64,
		Vector2.DOWN * 64,
		(Vector2.DOWN + Vector2.RIGHT) * 64,
	]
	for offset in offsets:
		for tile in get_parent().Tiles: #Dependency
			if tile.position == position + offset:
				surrounds.append(tile)
	
	return surrounds


func toggle_flag():
	if is_cover:
		if flagged:
			flagged = false
			$Flag.hide()
		else:
			flagged = true
			$Flag.show()


func _on_control_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_action_pressed("left_click"):
			uncover()
		if event.is_action_pressed("right_click"):
			toggle_flag()
