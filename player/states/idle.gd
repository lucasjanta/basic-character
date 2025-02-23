extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	player.velocity = Vector2(0,0)
	player.animation_player.play("idle")

func physics_update(delta: float) -> void:
	player.velocity.y += player.gravity * delta
	player.move_and_slide()
#
	if player.input_direction_x != 0:
		finished.emit(WALK)
	if Input.is_action_just_pressed("ui_select"):
		finished.emit(JUMP)
