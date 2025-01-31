@tool
extends MeshInstance3D
class_name Box3d
@export var size : Vector3 = Vector3(1,1,1) :
	set(value):
		update_mesh(value)
		size = value

@export var create_random_texture : bool = false :
	set(value):
		create_texture()


var collision : CollisionShape3D
var collision_shape : Shape3D

func _ready() -> void:
	mesh = BoxMesh.new()
	collision = CollisionShape3D.new()
	collision_shape = BoxShape3D.new()
	collision.shape = collision_shape
	collision_shape.size = size
	add_child(collision)
	mesh.size = size
	pass # Replace with function body.

func update_mesh(value: Vector3):
	if collision_shape:
		print(collision, "is collision")
		collision_shape.size = value
	mesh.size = value

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
	self.material_override = material
	material.uv1_triplanar = true
	print("created random noise texture")
	pass
