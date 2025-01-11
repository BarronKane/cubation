extends MeshInstance3D

var mat = self.get_active_material(0);

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var time: float = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta;
	if (mat != null):
		mat.set_shader_parameter("uTime", time)
