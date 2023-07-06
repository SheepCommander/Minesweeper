extends Node


@export var mainGameScene : PackedScene


func _on_new_game_button_button_up():
	# deletes curr scene and changes to other


	get_tree().change_scene_to_packed(mainGameScene)

