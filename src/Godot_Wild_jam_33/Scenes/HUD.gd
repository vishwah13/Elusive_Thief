extends CanvasLayer

signal Signal_timeout

var time :int = 60
var timeOut :bool
var playerGotCaught :bool

onready var Timelable =$Time
onready var Valuelable =$Value
onready var RestartLable = $RestartLable
onready var GameOverLable = $GameOverLable
onready var pauseLable = $pauselable

func _ready():
	RestartLable.hide()
	GameOverLable.hide()
	
func _process(delta):
	timeOut = time <= 0
	HandlePauseLable()
	
func updatevalue(value):
	Valuelable.text = str(value)

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_R:
			get_tree().reload_current_scene()
			get_tree().paused = false
		if time > 0 and !playerGotCaught:	
			if event.pressed and event.scancode == KEY_ESCAPE:
				get_tree().paused = !get_tree().paused


func _on_Timer_timeout():
	time -=1
	Timelable.text = str(time)
	
	if time <= 0:
		#get_node("../BGMusic").stop()
		get_node("../LoseSFX").play()
		emit_signal("Signal_timeout")
	
func _on_HUD_timeout():
	GameOverLable.show()
	playerGotCaught = true
	RestartLable.show()
	get_tree().paused = true
	
func HandlePauseLable():
	if get_tree().paused and !timeOut and !playerGotCaught:
		pauseLable.show()
	else:
		pauseLable.hide()
