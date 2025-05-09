extends Node
static var time = 0
func _ready():
	var file = FileAccess.open("user://save_game.dat", FileAccess.WRITE)
	
func _process(delta: float) -> void:
	time+=delta #will need a way to reset and pause

func store_objects(data:Dictionary, filename: String = "replay_001.rep") -> void:
	print(data) #Store the data here
