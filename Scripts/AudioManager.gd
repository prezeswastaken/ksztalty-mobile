extends Node


@export var enemy_death_sounds: Array[AudioStreamPlayer2D]
@export var player_death_sounds: Array[AudioStreamPlayer2D]
@export var music: AudioStreamPlayer2D

func play_enemy_death_sound():
    var choice = enemy_death_sounds[randi() % enemy_death_sounds.size()]
    choice.play()

func play_player_death_sound():
    var choice = player_death_sounds[randi() % player_death_sounds.size()]
    choice.play()

func stop_music():
    music.stop()
