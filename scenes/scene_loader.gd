extends Node
@export var current_scene : Node

func change_scene(scene_to_load : PackedScene) -> void:
	if current_scene:
		current_scene.queue_free() # <- usuń
	current_scene = scene_to_load.instantiate()
	add_child(current_scene)
