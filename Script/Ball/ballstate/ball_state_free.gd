class_name BallFree
extends ballstate

func _enter_tree() -> void:
	player_detection_area.body_entered.connect(on_player_enter.bind())

func on_player_enter(body: Player) -> void:
	ball.carrier = body
	state_transition_requested.emit(Ball.State.CARRY)

func _exit_tree() -> void:
	if player_detection_area.body_entered.is_connected(on_player_enter):
		player_detection_area.body_entered.disconnect(on_player_enter)
