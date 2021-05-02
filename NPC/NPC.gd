extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialogue")

var dialogue = [
	"Welcome to this game I made for class lol. (Press E to continue)"
	,"Apparently your life depends on your speed and accuracy or something."
	,"Use your Pew Pew Stick to shoot the five targets before time runs out"
	,"Oh, and did I tell you about the huge drone? (Press E to begin challenge)"
	]

func _ready():
	$AnimationPlayer.play("Idle")
	Dialogue.connect("finished_dialogue", self, "finished")

func _on_Area_body_entered(_body):
	Dialogue.start_dialogue(dialogue)
	
func _on_Area_body_exited(_body):
	Dialogue.hide_dialogue()

func finished():
	get_node("/root/Game/Target_container").show()
	Global.timer = 120
	Global.update_time()
	get_node("/root/Game/UI/Timer").start()
