extends Area3D
@export var scena : PackedScene

func _on_body_entered(body: Node3D) -> void:
	SceneLoader.change_scene(scena)
	pass # Replace with function body.
