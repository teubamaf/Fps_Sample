class_name WalkingPlayerState

extends State

@export var ANIMATION : AnimationPlayer
@export var TOP_ANIM_SPEED : float = 2.2

func enter() -> void:
	ANIMATION.play("Walking",-1,1.0)

func update(delta):
	set_animation_speep(Global.player.velocity.length())
	if Global.player.velocity.length() == 0.0:
		transition.emit("IdlePlayerState")

func set_animation_speep(speed):
	var alpha = remap(speed, 0.0, Global.player.SPEED_DEFAULT, 0.0, 1.0)
	ANIMATION.speed_scale = lerp(0.0, TOP_ANIM_SPEED, alpha)
