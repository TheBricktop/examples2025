extends Control

@export var platform2dScene : PackedScene
@export var platform3dScene : PackedScene

func _on_2d_pltfrm_btn_button_down() -> void:
	get_tree().change_scene_to_packed(platform2dScene)
	pass # Replace with function body.
	
func _on_3d_pltfrm_btn_button_down() -> void:
	get_tree().change_scene_to_packed(platform3dScene)
	pass # Replace with function body.
