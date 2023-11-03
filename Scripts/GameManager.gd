extends Node2D

enum GameState {Menu, Playing, GameOver}

@export var enemy_spawner: Node2D
@export var background: Node2D
@export var score_text_label: RichTextLabel
@export var game_over_screen: Panel

var score = 0
var game_state = GameState.Menu

var score_time_dict = {
    0 : 1.5,
    10 : 1,
    30 : 0.8,
    40 : 0.7,
    70 : 0.6,
    90 : 0.6,
    110 : 0.5,
    130 : 0.5,
    160 : 0.5,
    180 : 0.5,
    200 : 0.4,
    220 : 0.4,
    240 : 0.4,
    260 : 0.4,
    269 : 0.3,
    280 : 0.3,
    300 : 0.3,
    # add more scores and times as needed
}

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


func increment_score():
    score += 1
    if score_time_dict.has(score):
        enemy_spawner.time_btw_spawn = score_time_dict[score]
        background.increment_bg_state()
    score_text_label.text = "SCORE : %d" % score
    print("Score : ", score)
    print("Bg state : ", background.bg_state)

func end_the_game():
    game_over_screen.visible = true
    game_state = GameState.GameOver



func _on_button_pressed():
    get_tree().reload_current_scene()
    get_tree().paused = false
