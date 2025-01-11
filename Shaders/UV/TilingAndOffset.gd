@tool
extends VisualShaderNodeCustom
class_name VisualShaderNodeTilingAndOffset

func _get_name() -> String:
	return "TilingAndOffset"

func _get_category():
	return "UV"

func _get_code(input_vars, output_vars, mode, type):
	return "%s = vec2(%s) * vec2(%s) + vec2(%s);" % [output_vars[0], input_vars[0], input_vars[1], input_vars[2]]

func _get_default_input_port(type):
	return VisualShaderNode.PORT_TYPE_VECTOR_2D

func _get_description():
	return "Tiles and offsets UV."

func _get_input_port_count():
	return 3

func _get_input_port_default_value(port: int) -> Variant:
	match port:
		0:
			return Vector2(0, 0)
		1:
			return Vector2(0, 0)
		2:
			return Vector2(0, 0)
		_:
			return Vector2(0, 0)

func _get_input_port_type(port: int) -> PortType:
	match port:
		0:
			return PORT_TYPE_VECTOR_2D
		1:
			return PORT_TYPE_VECTOR_2D
		2:
			return PORT_TYPE_VECTOR_2D
		_:
			return PORT_TYPE_MAX;

func _get_input_port_name(port: int) -> String:
	match port:
		0:
			return "UV"
		1:
			return "Tiling"
		2:
			return "Offset"
		_:
			return "";

func _get_output_port_count() -> int:
	return 1

func _get_output_port_type(port: int) -> PortType:
	return PORT_TYPE_VECTOR_2D

func _get_output_port_name(port: int) -> String:
	return "Out"
