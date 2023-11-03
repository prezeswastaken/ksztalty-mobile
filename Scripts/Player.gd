extends Node2D

@export var textures: Array[Texture]
@onready var sprite = $Sprite2D

@export var previous_state_button: Button
@export var next_state_button: Button

var state

# Called when the node enters the scene tree for the first time.
func _ready():
    set_state(0)

    previous_state_button.pressed.connect(set_previous_state)
    next_state_button.pressed.connect(set_next_state)


func get_next_state ():
    if state == 2:
        return 0
    else:
        return state + 1

func get_previous_state ():
    if state == 0:
        return 2
    else:
        return state - 1

func set_state (new_state):
    state = new_state
    sprite.texture = textures[new_state]

func set_next_state ():
    set_state(get_next_state())

func set_previous_state ():
    set_state(get_previous_state())

