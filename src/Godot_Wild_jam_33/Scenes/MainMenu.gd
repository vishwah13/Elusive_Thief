extends Node2D

onready var SceneChanger = $SceneChanger
onready var LevelsCanvas = get_node("SceneChanger/levels")

func _on_StartButton_pressed():
	SceneChanger.change_scene("res://Scenes/Lvl.tscn")


func _on_LevelsButton_pressed():
	LevelsCanvas.show()


func _on_Quitbutton_pressed():
	get_tree().quit()


func _on_Back_pressed():
	get_node("SceneChanger/levels").hide()


func _on_Level1_pressed():
	SceneChanger.change_scene("res://Scenes/Lvl.tscn")


func _on_Level2_pressed():
	SceneChanger.change_scene("res://Scenes/LVL2.tscn")


func _on_Level3_pressed():
	SceneChanger.change_scene("res://Scenes/LVL3.tscn")


func _on_Level4_pressed():
	SceneChanger.change_scene("res://Scenes/LVL4.tscn")


func _on_Level5_pressed():
	SceneChanger.change_scene("res://Scenes/LVL5.tscn")
