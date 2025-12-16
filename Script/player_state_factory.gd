class_name PlayerStateFactory

var states : Dictionary

func _init() -> void:
	states = {
		Player.State.MOVING: PlayerStateMoving,
		Player.State.SLIDE: PlayerStateSlide,
		Player.State.SHOOT: PlayerStateShoot
	}
	
func get_fresh_state(state: Player.State) -> PlayerState:
	assert(states.has(state), "State Doesn't exist")
	return states.get(state).new()
