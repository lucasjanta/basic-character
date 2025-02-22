extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.animation_player.play("walk")

func physics_update(delta: float) -> void:
	player.velocity.x = player.input_direction_x * player.speed
	
	player.move_and_slide()
#
	if player.input_direction_x == 0:
		finished.emit(IDLE)
	if Input.is_action_just_pressed("ui_select"):
		finished.emit(JUMP)
