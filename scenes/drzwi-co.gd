extends MeshInstance3D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_interactable_on_interact() -> void:
	animation_player.play("new_animation")
	pass # Replace with function body.
