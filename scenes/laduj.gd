extends Area3D
@export var scena : PackedScene

func _on_body_entered(body: Node3D) -> void:
	get_tree().change_scene_to_packed(scena)
	pass # Replace with function body.
