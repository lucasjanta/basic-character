extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	player.animation_player.play("down_jump")

func physics_update(delta: float) -> void:
	player.velocity.x = player.input_direction_x * player.speed
	player.velocity.y += player.gravity * delta
	player.move_and_slide()
	
	if player.is_on_floor():
		player.animation_player.play("arrive_jump")

	if player.is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		finished.emit(JUMP)
		
func _on_animation_player_animation_finished(anim_name):
	if anim_name == "arrive_jump":
		finished.emit(IDLE)
		
