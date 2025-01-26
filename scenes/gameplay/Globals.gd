extends Node
var points = 30
var hp_player: ProgressBar 
var killed = 0
func updateProgress():
	hp_player.value = points
