extends Area2D

func _on_body_entered(_body: Node2D) -> void:
	if body_entered:
		$AudioStreamPlayer2D.play()
		await get_tree().create_timer(3).timeout
		get_tree().reload_current_scene()
		
