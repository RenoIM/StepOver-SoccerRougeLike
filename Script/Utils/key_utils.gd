extends Node

enum Action {LEFT, RIGHT, UP, DOWN, KICK, SLIDE, PASS}

const ACTIONS_MAP : Dictionary = {
	Player.ControlScheme.P1: {
		Action.LEFT: "MoveLeft",
		Action.RIGHT: "MoveRight",
		Action.UP: "MoveUp",
		Action.DOWN: "MoveDown",
		Action.KICK: "Kick" ,
		Action.SLIDE: "Slide",
		Action.PASS: "Pass"
	}
}


# ingatin buat tambahin comment
func get_input_vector(scheme: Player.ControlScheme) -> Vector2:
	var map : Dictionary = ACTIONS_MAP[scheme]
	return Input.get_vector(map[Action.LEFT], map[Action.RIGHT] ,map[Action.UP] ,map[Action.DOWN])

func is_action_pressed(scheme: Player.ControlScheme, action: Action) -> bool:
	return Input.is_action_just_pressed(ACTIONS_MAP[scheme][action])
	
func is_action_just_pressed(scheme: Player.ControlScheme, action: Action) -> bool:
	return Input.is_action_just_pressed(ACTIONS_MAP[scheme][action])
	
func is_action_just_released(scheme: Player.ControlScheme, action: Action) -> bool:
	return Input.is_action_just_pressed(ACTIONS_MAP[scheme][action])
