extends CharacterBody3D

@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D
@export var SPEED : float = 2.0
@export var Rotation_SPEED : float = .1
@export var radius : float = 50
@onready var model: Node3D = $Model
@onready var animation_player: AnimationPlayer = $Model/Barbarian/AnimationPlayer
@onready var startpos = self.global_position
@onready var lastpos = self.global_position

enum State {IDLE, WALK, FLOAT}
var state : State = State.IDLE
var destination : Vector3
var direction : Vector3

func _ready() -> void:
	to_idle()

func _physics_process(delta: float) -> void:
	if !is_on_floor():
		to_float()
	
	match state:
		State.IDLE:
			state_idle()
			pass
		State.WALK:
			state_walk()
			pass
		State.FLOAT:
			state_float()
			pass
	move_and_slide()

 
func to_idle():
	state = State.IDLE
	await get_tree().create_timer(randf()*10).timeout

	to_walk()
	pass

func state_idle():
	velocity = lerp(velocity,Vector3.ZERO,.3)
	animation_player.play("Idle")
	pass

func to_walk():
	navigation_agent_3d.target_position = global_position + Vector3(randf_range(-10,10),0,randf_range(-10,10))
	print("im walking here")
	state = State.WALK
	pass

func state_walk():
	if navigation_agent_3d.is_navigation_finished():
		print("im finished")
		to_idle()
		return
	
	animation_player.play("Walking_A")
	destination = navigation_agent_3d.get_next_path_position()
	var local_destination = destination - global_position
	direction = local_destination.normalized()
	
	velocity = direction * SPEED
	
	var newTransform = model.transform.looking_at(-velocity,Vector3.UP)
	model.transform = model.transform.interpolate_with(newTransform,Rotation_SPEED)
	model.global_rotation = Vector3(0,model.global_rotation.y,0)
	pass
	
func to_float():
	state = State.FLOAT
	pass

func state_float():
	velocity = lerp(velocity,Vector3.DOWN * 2,.3)
	animation_player.play("Jump_Idle")
	if is_on_floor():
		to_idle()
	pass
