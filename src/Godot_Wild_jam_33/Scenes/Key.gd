extends Area2D




func _on_Key_body_entered(body):
	if body.name == "Player":
		get_node("..").AddKey()
		get_node("../Player/ItemAudio").play()
		queue_free()
