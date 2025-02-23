extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	player.animation_player.play("up_jump")
	player.velocity.y -= player.jump_impulse

func physics_update(delta: float) -> void:
	player.velocity.x = player.input_direction_x * player.speed
	player.velocity.y += player.gravity * delta
	player.move_and_slide()
	
	if player.velocity.y > 0:
		finished.emit(FALL)
