extends Resource
class_name Scoreline


@export var score1: int
@export var score2: int
@export var date: String

func _init(score1_, score2_, date_):
	score1 = score1_
	score2 = score2_
	date = date_
	
