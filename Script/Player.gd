class_name Player
extends CharacterBody2D

enum ControlScheme {CPU, P1}
enum State {MOVING, SLIDE}

@export var control_scheme : ControlScheme
@export var speed : float

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player_sprite: Sprite2D = %PlayerSprite
 
var current_state: PlayerState = null
var heading := Vector2.RIGHT
var state_factory := PlayerStateFactory.new()

func _ready() -> void:
	switch_state(State.MOVING)

func _process(_delta: float) -> void:
	flip_sprites()
	move_and_slide()

func switch_state(state: State) -> void:
	if current_state != null:
		current_state.queue_free()
	current_state = state_factory.get_fresh_state(state)
	current_state.setup(self, animation_player)
	current_state.state_transition_requested.connect(switch_state.bind())
	current_state.name = "PlayerStateMachine: " + str(state)
	call_deferred("add_child", current_state)
func handle_human_movement() -> void:
	var direction := KeyUtils.get_input_vector(control_scheme)
	velocity = direction * speed
	
func set_movement_animation() -> void:
	if velocity.length() > 0:
		animation_player.play("Walk")
	else:
		animation_player.play("Idle")

func set_heading() -> void:
	if velocity.x > 0:
		heading = Vector2.RIGHT
	elif velocity.x < 0: 
		heading = Vector2.LEFT

func flip_sprites() -> void:
	if heading == Vector2.RIGHT:
		player_sprite.flip_h = false
	elif heading == Vector2.LEFT:
		player_sprite.flip_h = true
