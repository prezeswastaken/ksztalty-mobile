extends Node2D

@export var timer: Timer
@export var enemy_scene: PackedScene
@export var player: Node2D
@export var game_manager: Node2D
@export var audio_manager: Node

@export var time_btw_spawn: float

var enemies = []

func _ready():
    time_btw_spawn = game_manager.score_time_dict[0]
    timer.start()

func _on_timer_timeout():
    move_enemies()
    spawn_enemy()
    timer.wait_time = time_btw_spawn
    timer.stop()
    timer.start()


func spawn_enemy():
    var new_enemy = enemy_scene.instantiate()
    add_child(new_enemy)

    enemies.append(new_enemy)

func move_enemies():
    if enemies.size() == 0:
        return
    for enemy in enemies:
        enemy.translate(Vector2(-200,0))
    if enemies[0].position.x <= -600:
        attack_player()

func attack_player():
    var first_enemy = enemies[0]
    if first_enemy.state == player.state:
        enemies.remove_at(0)
        first_enemy.die(time_btw_spawn / 2)
        game_manager.increment_score()
    else:
        player.queue_free()
        audio_manager.play_player_death_sound()
        audio_manager.stop_music()
        game_manager.end_the_game()
        get_tree().paused = true

