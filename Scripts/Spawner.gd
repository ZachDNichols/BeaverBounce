extends Node2D

var windowSize
var regularPlatform = preload("res://Scenes/Static Platform.tscn")

@onready var camera = $"../Camera2D"
@onready var beaver = $"../Beaver"
@onready var viewPort = get_viewport()

var spawnedItems = []

enum PlatformType {Regular, Moving}
# Called when the node enters the scene tree for the first time.
func _ready():
	windowSize = DisplayServer.window_get_size()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	windowSize = DisplayServer.window_get_size()
	for i in range(len(spawnedItems)):
		var item = spawnedItems[i]
		if item.position.y > beaver.position.y + windowSize.y / 1.8:
			spawnedItems.pop_at(i)
			item.queue_free()

func spawnPlatforms():
	var horizontalPlatforms = floor(windowSize.x / 12)

func spawnPlatform(platformToSpawn, x, y):
	var object
	match platformToSpawn:
		PlatformType.Regular:
			object = regularPlatform.instantiate()
			object.global_position = Vector2(0, 0)
			viewPort.call_deferred("add_child",object)
		PlatformType.Moving:
			pass
	spawnedItems.append(object)
			
