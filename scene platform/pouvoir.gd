extends Area2D

var scene_to_load = "res://scene platform/node_2d.tscn"
var inZoneDect = false

@onready var label1 = $'../Label'

# Called when the node enters the scene tree for the first time.
func _ready():
	label1.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if inZoneDect == true :
		prendrePouvoir()
	
func detecEntrerlabel1(body):
	label1.visible = true
	inZoneDect = true
	
func detectSortiLabel1(body):
	label1.visible = false
	inZoneDect = false
	
func prendrePouvoir():
	if Input.is_action_just_pressed("interagir"):
		# Chargez la nouvelle scène
		remove_child($PouvoirFoudre1)
