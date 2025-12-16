extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var area: Area2D = $Area2D

var exploded := false

func _ready():
	area.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if exploded:
		return

	if body.is_in_group("Player"):
		explode()

func explode():
	exploded = true
	animation_player.play("Explode")
	print("MINE EXPLODED")


	# Remove mine after animation finishes
	await animation_player.animation_finished
	queue_free()
