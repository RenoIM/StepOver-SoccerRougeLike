class_name PlayerStateMoving
extends PlayerState

var BOUNCE_SPEED := 10.0
var BOUNCE_AMOUNT := 0.10
var bounce_time := 0.0

func _process(delta: float) -> void:
	if player.control_scheme == Player.ControlScheme.CPU:
		pass
	else:
		handle_human_movement()

	player.set_movement_animation()
	player.set_heading()
	apply_bounce(delta)

func handle_human_movement() -> void:
	var direction := KeyUtils.get_input_vector(player.control_scheme)
	player.velocity = direction * player.speed
	
	if player.velocity != Vector2.ZERO \
	and KeyUtils.is_action_just_pressed(player.control_scheme, KeyUtils.Action.SLIDE):
		state_transition_requested.emit(Player.State.SLIDE)

func apply_bounce(delta: float) -> void:
	var speed := player.velocity.length()

	if speed > 0:
		# Normalize velocity (0..1)
		var intensity = clamp(speed / player.speed, 0.0, 1.0)

		# Advance bounce faster when moving faster
		bounce_time += delta * BOUNCE_SPEED * intensity

		# Scale bounce amount by velocity
		var squash = sin(bounce_time) * BOUNCE_AMOUNT * intensity

		player.player_sprite.scale = Vector2(
			1.0 + squash,
			1.0 - squash
		)
	else:
		# Smooth reset
		player.player_sprite.scale = player.player_sprite.scale.lerp(Vector2.ONE, 10.0 * delta)
		bounce_time = 0.0
