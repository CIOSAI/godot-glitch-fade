extends Panel

const directions = [Vector2.UP, Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT]

onready var tw = $"Tween"
onready var dir = $"Container/VBoxContainer/HBoxContainer/OptionButton"
onready var easing = $"Container/VBoxContainer/HBoxContainer2/OptionButton"
onready var dur = $"Container/VBoxContainer/HBoxContainer3/OptionButton"

var b:bool = true
var x:float = 1

func _ready():
	var ease_types = ['TRANS_LINEAR', 'TRANS_SINE', 'TRANS_QUINT', 'TRANS_QUART', 'TRANS_QUAD', 'TRANS_EXPO', 'TRANS_ELASTIC', 'TRANS_CUBIC', 'TRANS_CIRC', 'TRANS_BOUNCE']
	
	for i in ease_types:
		easing.add_item(i)

func get_direction()->Vector2:
	return directions[max(dir.selected, 0)]

func _on_play():
	tw.interpolate_property(
		self, "x",
		get_direction().x+get_direction().y, -(get_direction().x+get_direction().y),
		dur.value, max(easing.selected, 0), Tween.EASE_OUT_IN
	)
	tw.interpolate_property(
		self, "b",
		b, get_direction().x!=0,
		0
	)
	tw.start()
