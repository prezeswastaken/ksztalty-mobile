extends Node2D

@export var background_textures: Array[Texture]
@onready var sprite = $Sprite2D

var bg_state = 0

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func increment_bg_state():
    bg_state += 1
    sprite.texture = background_textures[bg_state]
