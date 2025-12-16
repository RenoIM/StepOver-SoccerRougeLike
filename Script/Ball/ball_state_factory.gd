class_name ballstatefactory

var states : Dictionary

func _init() -> void:
	states = {
		Ball.State.CARRY: BallCarry,
		Ball.State.FREE: BallFree,
		Ball.State.SHOT: BallShot,
	}

func get_fresh_state(state: Ball.State) -> ballstate:
	assert(states.has(state),"state doesn't exist!")
	return states.get(state).new()
	
