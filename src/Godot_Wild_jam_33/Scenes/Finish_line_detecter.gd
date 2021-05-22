extends Area2D

onready var SceneChanger = get_node("../SceneChanger")


func _on_Finish_line_detecter_body_entered(body):
	if body.name == "Player":
		SceneChanger.change_scene()
