class_name PlayerStateSlide
extends PlayerState

var DURATION_SLIDE := 200

var time_start_slide := Time.get_ticks_msec()

func _enter_tree() -> void:
	player.animation_player.play("slide")
	time_start_slide = Time.get_ticks_msec()
	
func _process(_delta: float) -> void:
	if Time.get_ticks_msec() - time_start_slide > DURATION_SLIDE:
		state_transition_requested.emit(Player.State.MOVING)
