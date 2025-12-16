class_name BallCarry
extends ballstate

const OFFSET_FROM_PLAYER := 16.0

var dribble_time := 0.0

func _enter_tree() -> void:
	assert(ball.carrier != null)

func _process(delta: float) -> void:
	
	if carrier.velocity != Vector2.ZERO:
		dribble_time += delta
		
		if carrier.heading.x >= 0:
			animation_player.play("roll")
		else:
			animation_player.play_backwards("roll")
	else:
		animation_player.play("idle")
		
	ball.position = ball.carrier.position + ball.carrier.heading * OFFSET_FROM_PLAYER
