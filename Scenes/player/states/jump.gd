extends PlayerState

var descending : bool
var landing : bool 

func enter(previous_state_path: String, data := {}) -> void:
	player.animation_player.play("up_jump")
	player.velocity.y -= player.jump_impulse
	descending = false
	landing = false

func physics_update(delta: float) -> void:
	if landing:
		player.velocity.x = 0
	else:
		player.velocity.x = player.input_direction_x * player.speed
	player.velocity.y += player.gravity * delta
	if player.velocity.y > 0 and !descending:
		player.animation_player.play("down_jump")
		descending = true
	player.move_and_slide()
	
	if player.is_on_floor() and descending:
		player.animation_player.play("arrive_jump")
		landing = true

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "arrive_jump":
		finished.emit(IDLE)
