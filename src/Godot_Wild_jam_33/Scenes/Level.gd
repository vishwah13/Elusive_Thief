extends Node2D

var value :int = 0
var Key :int = 0
export var ValueToExit :int = 1
onready var Pauselable = $HUD/pauselable
onready var door = $Door

onready var BGMusic = $BGMusic
onready var ExitDoorSFX = $ExitDoorSFX

func _ready():
	BGMusic.play()

func update_HUD_Value(n):
	value +=n
	$HUD.updatevalue(value)

func AddKey():
	Key +=1
	print(Key)
func RemoveKey():
	Key -=1
	print(Key)
	
func CheckForKey() -> bool:
	if Key > 0:
		return true
	else:
		return false
	
func _process(delta):
	handle_Door_open()
		
	
			
func handle_Door_open():
	if ValueToExit == value:
		door.hide()
		door.set_collision_mask_bit(0,false)
		ExitDoorSFX.play()
		ValueToExit +=1

func _on_Finish_line_detecter_body_entered(body):
	if body.name == "Player":
		$SceneChanger.change_scene()
	
