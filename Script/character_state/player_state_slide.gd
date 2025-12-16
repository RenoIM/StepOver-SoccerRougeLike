class_name PlayerStateSlide
extends PlayerState

var DURATION_SLIDE := 300
var SLIDE_MULTIPLIER := 2.0
var DECELERATION := 12.0 # higher = faster stop
var time_start_slide := Time.get_ticks_msec()
var slide_direction := Vector2.ZERO

func _enter_tree() -> void:
	var direction := KeyUtils.get_input_vector(player.control_scheme)
	player.animation_player.play("slide")
	time_start_slide = Time.get_ticks_msec()
	player.velocity = direction * player.speed * SLIDE_MULTIPLIER
	
func _process(delta: float) -> void:
	# Smoothly reduce velocity toward zero
	player.velocity = player.velocity.lerp(Vector2.ZERO, DECELERATION * delta)
	# End slide if slow enough OR duration exceeded
	if player.velocity.length() < 10 \
	or Time.get_ticks_msec() - time_start_slide > DURATION_SLIDE:
		player.velocity = Vector2.ZERO
		state_transition_requested.emit(Player.State.MOVING)
