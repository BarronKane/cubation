@tool
extends VisualShaderNodeCustom
class_name VisualShaderNodeColorMask

func _get_name() -> String:
	return "ColorMask"

func _get_category():
	return "UV"

func _get_code(input_vars, output_vars, mode, type):
	return """
	float Distance = distance(%s, %s);
	float resolve = 1.0 - (Distance - %s) / max(%s, 0.00001);
	%s = clamp(resolve, 0.0, 1.0);
	""" % [input_vars[1], input_vars[0], input_vars[2], input_vars[3], output_vars[0]]

func _get_default_input_port(type):
	return VisualShaderNode.PORT_TYPE_VECTOR_2D

func _get_description():
	return "Generates a regular polygon shape based on input UV at specified sizes."

func _get_input_port_count():
	return 4

func _get_input_port_default_value(port: int) -> Variant:
	match port:
		0:
			return Vector3(0, 0, 0)
		1:
			return Vector3(0, 0, 0)
		2:
			return float(0)
		3:
			return float(0)
		_:
			return float(0)

func _get_input_port_type(port: int) -> PortType:
	match port:
		0:
			return PORT_TYPE_VECTOR_3D
		1:
			return PORT_TYPE_VECTOR_3D
		2:
			return PORT_TYPE_SCALAR
		3:
			return PORT_TYPE_SCALAR
		_:
			return PORT_TYPE_MAX;

func _get_input_port_name(port: int) -> String:
	match port:
		0:
			return "In"
		1:
			return "MaskColor"
		2:
			return "Range"
		3:
			return "Fuzziness"
		_:
			return "";

func _get_output_port_count() -> int:
	return 1

func _get_output_port_type(port: int) -> PortType:
	return PORT_TYPE_SCALAR

func _get_output_port_name(port: int) -> String:
	return "Out"
