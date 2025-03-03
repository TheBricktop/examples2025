extends Area3D
@onready var animation_player: AnimationPlayer = $"../RigidBody3D/AnimationPlayer"



func _on_body_entered(body: Node3D) -> void:
	animation_player.play("otwieranie")
	pass # Replace with function body.


func _on_body_exited(body: Node3D) -> void:
	animation_player.play_backwards("otwieranie")
	pass # Replace with function body.
