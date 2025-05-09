class_name light_bulb
extends Recordable
var color : Color = Color.ANTIQUE_WHITE
var state : bool
func get_record_data()->Dictionary:
	return({"state":state})
