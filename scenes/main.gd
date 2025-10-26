extends Node3D
@export var firstScene : PackedScene

# Ładuje pierwszą scene
func _ready() -> void:
	get_tree().change_scene_to_packed(firstScene)
