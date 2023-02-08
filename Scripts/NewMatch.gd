extends VBoxContainer


@export_node_path(LineEdit) var score1_input
@export_node_path(LineEdit) var score2_input 

@export_file var scorelines_record_path

var score1: int
var score2: int
var scorelines_record: Resource
var new_scoreline: Resource
var date: String


func _ready():
	score1_input = get_node(score1_input)
	score2_input = get_node(score2_input)
	
	scorelines_record = ResourceLoader.load(scorelines_record_path) as ScorelinesRecord
	
	var date_dict = Time.get_date_dict_from_system()
	date = "%s / %s / %s" % [date_dict.day, date_dict.month, date_dict.year]


func _on_enter_pressed():
	if score1_input.text != "" and score2_input.text != "":
		score1 = score1_input.text.to_int()
		score2 = score2_input.text.to_int()
		
		new_scoreline = Scoreline.new(score1, score2, date)
		scorelines_record.scorelines.append(new_scoreline)
		
		# Save the updated scorelines_record
		ResourceSaver.save(scorelines_record, scorelines_record_path)
