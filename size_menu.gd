extends Node

@export var mainGameScene : PackedScene


func _on_button_button_up():
	var scene = mainGameScene.instantiate()
	
	var x : int = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer/TilesX.get_value()
	var y : int = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer2/TilesY.get_value()
	var mines : int = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer3/Mines.get_value()
	print(x," ",y," ",mines)
	scene.options(x,y,mines)
	get_tree().change_scene_to_packed(scene)
