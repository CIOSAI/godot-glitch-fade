extends Node2D

onready var img = $"Image"
onready var img_panel = $"CanvasLayer/ImagePanel"
onready var vp = $"VPTexture"
onready var vp_panel = $"CanvasLayer/VPPanel"

func _process(delta):
	img.material.set_shader_param("horizontal", img_panel.b)
	img.material.set_shader_param("distort", img_panel.x)
	
	vp.material.set_shader_param("horizontal", vp_panel.b)
	vp.material.set_shader_param("distort", vp_panel.x)
