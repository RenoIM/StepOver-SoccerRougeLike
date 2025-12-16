class_name PlayerStateShoot
extends PlayerState

func _enter_tree() -> void:
	animation_player.play("kick")
