class_name Ball
extends AnimatableBody2D

enum State {CARRY, FREE, SHOT}
@onready var player_ditection: Area2D = %PlayerDitection

var carrier : Player = null
var current_state : ballstate = null
var state_factory := ballstatefactory.new()
var velocity = Vector2.ZERO

func _ready() -> void:
	switch_state(State.FREE)

func switch_state(state: Ball.State) -> void:
	if current_state != null:
		current_state.queue_free()
	current_state = state_factory.get_fresh_state(state)
	current_state.setup(self, player_ditection, carrier)
	current_state.state_transition_requested.connect(switch_state.bind())
	current_state.name = "BallStateMachine"
	call_deferred("add_child", current_state)
