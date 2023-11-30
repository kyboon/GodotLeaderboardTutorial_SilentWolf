extends Node2D

@export var score_label: Label
@export var timer_label: Label
@export var leaderboard_label: Label
@export var timer: Timer
@export var game_over_panel: Panel
@export var game_over_score_label: Label
@export var player_name_text_edit: TextEdit
@export var submit_button: Button

var score: int = 0
var started := false
var game_over := false
# Called when the node enters the scene tree for the first time.
func _ready():
	game_over_panel.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if started and !game_over:
		timer_label.text = "Time left: %.02f" % timer.time_left


func _on_click_button_pressed():
	if !game_over:
		if started:
			score += 1
			score_label.text = "Score: %d" % score
		else:
			started = true
			timer.start()

func _on_timer_timeout():
	# game over
	game_over = true
	game_over_panel.visible = true
	game_over_score_label.text = "Your score: %d" % score


func _on_restart_button_pressed():
	get_tree().reload_current_scene()
