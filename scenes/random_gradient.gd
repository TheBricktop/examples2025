extends ColorRect
var grad_tex : GradientTexture1D
var gradient : Gradient
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grad_tex = GradientTexture1D.new()
	gradient = Gradient.new()
	
	grad_tex.width = 4
	gradient.interpolation_mode = Gradient.GRADIENT_INTERPOLATE_CONSTANT
	print("variable 1",randf_range(0,1))
	
	gradient.set_color(0,  Color.BLACK)
	gradient.add_point(.25,Color.from_hsv(randf_range(0,1),1,1,1))
	gradient.add_point(.5, Color.from_hsv(randf_range(0,1),1,1,1))
	gradient.add_point(.75,Color.from_hsv(randf_range(0,1),1,1,1))
	gradient.set_color(1,  Color.BLACK)
	
	grad_tex.gradient = gradient
	material.set("shader_parameter/Gradient", grad_tex)
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		changeTex()
	pass

func changeTex():
	grad_tex = GradientTexture1D.new()
	gradient = Gradient.new()
	grad_tex.width = 4
	
	gradient.interpolation_mode = Gradient.GRADIENT_INTERPOLATE_CONSTANT
	grad_tex.gradient = gradient
	
	gradient.set_color(0,  Color.BLACK)
	gradient.add_point(.25,Color.from_hsv(randf_range(0,1),1,1))
	gradient.add_point(.5, Color.from_hsv(randf_range(0,1),1,1))
	gradient.add_point(.75,Color.from_hsv(randf_range(0,1),1,1))
	gradient.set_color(1,  Color.from_hsv(randf_range(0,1),1,.1))
	
	material.set("shader_parameter/Gradient", grad_tex)
	
