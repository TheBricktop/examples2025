extends Node3D
@export var speed : float = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_y(delta * speed)
	pass
