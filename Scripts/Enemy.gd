extends Node2D


@export var textures: Array[Texture]
@onready var sprite = $Sprite2D


@onready var audio_manager

var state: int
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
    audio_manager = get_node("/root/MainGame/AudioManager")
    print (audio_manager)
    var random_state = rng.randf_range(0, 2)
    set_state(random_state)


func set_state(new_state):
    state = new_state
    sprite.texture = textures[new_state]

func die(delay):
    audio_manager.play_enemy_death_sound()
    await get_tree().create_timer(delay).timeout
    queue_free()
