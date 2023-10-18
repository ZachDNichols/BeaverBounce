extends Node2D

var windowSize
var regularPlatform = preload("res://Scenes/Static Platform.tscn")
@onready var camera = $"../Camera2D"
@onready var viewPort = get_viewport()
enum PlatformType {Regular}

# Called when the node enters the scene tree for the first time.
func _ready():
	windowSize = DisplayServer.window_get_size()
	spawnPlatform(PlatformType.Regular)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	windowSize = DisplayServer.window_get_size()

func spawnPlatform(platformToSpawn):
	match platformToSpawn:
		PlatformType.Regular:
			var object = regularPlatform.instantiate()
			object.global_position = Vector2(0, 0)
			viewPort.call_deferred("add_child",object)
