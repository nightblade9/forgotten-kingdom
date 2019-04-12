extends Spatial

export var number:int = 0

const Player = preload("res://scenes/entities/Player.gd")

var _base_y:float
var _total_elapsed:float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
#	self._base_y = self.translation.y 
	self._base_y = $MeshInstance.translation.y # just the mesh

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_total_elapsed += delta
	$MeshInstance.translation.y = _base_y + 0.5 + cos(_total_elapsed)

func _on_Area_body_entered(body):
	if body is Player:
		var key_index = body.keys.find(self.number)
		if key_index > -1:
			body.keys.remove(key_index)
			self.get_parent().remove_child(self)
			self.queue_free()