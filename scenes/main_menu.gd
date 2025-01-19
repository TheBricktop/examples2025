extends Control

@export var platform2dScene : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_d_pltfrm_btn_button_down() -> void:
	SceneLoader.change_scene(platform2dScene)
	pass # Replace with function body.
