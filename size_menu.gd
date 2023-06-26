extends Node


func _on_button_button_up():
	print("aaaa")
	var game = preload ("res://main.tscn").instance()
	get_tree().change_scene_to_packed(game)
