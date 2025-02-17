@tool
extends MeshInstance3D
class_name RandomMat3d

@export var parent : Node3D

@export var create_random_texture : bool = false :
	set(value):
		create_texture()

func create_texture() -> void :
	
	var material : StandardMaterial3D = StandardMaterial3D.new()
	var noise_tex = NoiseTexture2D.new()
	material.albedo_texture = noise_tex
	var fnoise = FastNoiseLite.new()
	fnoise.seed = randi_range(0,10000)
	fnoise.fractal_type = randi_range(0,3)
	noise_tex.seamless = true
	noise_tex.noise = fnoise

	var grad = Gradient.new()
	print("points : ",grad.get_point_count())
	grad.set_color(0,Color.from_hsv(randf_range(0,1),.5,.25,1))
	randomize()
	grad.set_color(1,Color.from_hsv(randf_range(0,1),.75,.75,1))
	noise_tex.color_ramp = grad
	mesh.material_override = material
	material.uv1_triplanar = true
	print("created random noise texture")
	pass
