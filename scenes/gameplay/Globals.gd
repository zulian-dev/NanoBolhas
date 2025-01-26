extends Node
var points = 0
var hp_player: ProgressBar 

func updateProgress():
	hp_player.value = points
