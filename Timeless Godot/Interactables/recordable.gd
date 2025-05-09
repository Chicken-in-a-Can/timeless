class_name Recordable
extends Node3D
##Interactables should extend this


func _ready() -> void:
	add_to_group("Recordable", true)
	
func get_record_data()->Dictionary:
	return({"ERROR":null})#This should never run, objects should override
