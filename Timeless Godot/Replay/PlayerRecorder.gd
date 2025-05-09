extends Node
var recordID : int = Time.get_unix_time_from_system()
func _ready() -> void:
	pass # Replace ith function body.

func _process(delta: float) -> void:
	pass
func _physics_process(delta: float) -> void:
	record_frame()
	
func record_frame() -> void:
	var frame : Dictionary = {
		"time":ReplayRecorder.time,
		"Objects": {
			recordID:{
				"Position":get_parent().position,
				"rotation":get_parent().rotation
			}
		}
	}
	for i in get_tree().get_nodes_in_group("Recordables"):
		frame["Objects"][i.recordID]=i.get_data()
	ReplayRecorder.store_objects(frame)
