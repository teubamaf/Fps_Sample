class_name WalkingPlayerState

extends PlayerMovementState

@export var SPEED: float = 5
@export var ACCELERATION : float = 0.1
@export var DECELERATION : float = 0.25
@export var TOP_ANIM_SPEED : float = 2.2

func enter() -> void:
	ANIMATION.play("Walking",-1,1.0)

func update(delta):
	PLAYER.update_gravity(delta)
	PLAYER.update_input(SPEED,ACCELERATION,DECELERATION)
	PLAYER.update_velocity()
	
	set_animation_speed(PLAYER.velocity.length())
	if PLAYER.velocity.length() == 0.0:
		transition.emit("IdlePlayerState")

func set_animation_speed(speed):
	var alpha = remap(speed, 0.0, SPEED, 0.0, 1.0)
	ANIMATION.speed_scale = lerp(0.0, TOP_ANIM_SPEED, alpha)

func _input(event) -> void : 
	if event.is_action_pressed("sprint"):
		transition.emit("SprintingPlayerState")
