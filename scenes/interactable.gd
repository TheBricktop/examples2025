extends StaticBody3D
class_name Interactable

signal on_interact

# Called when the node enters the scene tree for the first time.
func interact():
	on_interact.emit()
