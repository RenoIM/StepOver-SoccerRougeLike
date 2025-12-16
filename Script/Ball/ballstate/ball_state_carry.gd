class_name BallCarry
extends ballstate

func _enter_tree() -> void:
	assert(carrier != null)

func _process(delta: float) -> void:
	ball.position = carrier.position
