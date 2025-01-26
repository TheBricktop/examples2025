extends Node3D
@export var firstScene : PackedScene

# Ładuje pierwszą scene
func _ready() -> void:
	SceneLoader.change_scene(firstScene)
