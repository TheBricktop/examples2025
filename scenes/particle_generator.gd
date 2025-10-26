@tool
extends Node3D
class_name Particle_Generator
@export_tool_button("Create Smoke Particles","AABB") var create_action = create
@export var amount := 12
@export var angle := 12
@export var lifetime := 2
@export var gravity := 5
@export var texture : Texture2D
@export var scale_curve : CurveTexture
@export var alpha_curve : CurveTexture
@export var color_ramp : GradientTexture1D
@export var mesh : Mesh

func create():
	var particles := GPUParticles3D.new()
	particles.amount = amount
	particles.lifetime = lifetime
	
	var processing_mat := ParticleProcessMaterial.new()
	processing_mat.gravity = Vector3.UP * gravity
	processing_mat.angle_max = angle
	processing_mat.angle_min = -angle
	processing_mat.scale_curve = scale_curve
	processing_mat.alpha_curve = alpha_curve
	processing_mat.color_ramp = color_ramp
	
	var draw_pass := QuadMesh.new()
	var new_mat := StandardMaterial3D.new()
	new_mat.albedo_texture = texture
	new_mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	new_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	new_mat.blend_mode = BaseMaterial3D.BLEND_MODE_PREMULT_ALPHA
	new_mat.billboard_keep_scale = true
	new_mat.billboard_mode = BaseMaterial3D.BILLBOARD_PARTICLES
	new_mat.vertex_color_use_as_albedo = true
	
	particles.material_override = new_mat
	particles.process_material = processing_mat
	particles.draw_pass_1 = draw_pass
	add_child(particles)
	print(particles)
	particles.owner = get_tree().get_edited_scene_root()
	pass
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
