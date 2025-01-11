@tool
extends VisualShaderNodeCustom
class_name VisualShaderNodeRGBASplit

func _get_name() -> String:
	return "RGBASplit"

func _get_category():
	return "Color"

func _get_code(input_vars, output_vars, mode, type):
	return """
	vec4 input = %s;
	%s = input[0];
	%s = input[1];
	%s = input[2];
	%s = input[3];
	""" % [input_vars[0], output_vars[0], output_vars[1], output_vars[2], output_vars[3]]

func _get_default_input_port(type):
	return VisualShaderNode.PORT_TYPE_VECTOR_2D

func _get_description():
	return "Generates a regular polygon shape based on input UV at specified sizes."

func _get_input_port_count():
	return 1

func _get_input_port_default_value(port: int) -> Variant:
	match port:
		0:
			return Vector3(0, 0, 0)
		_:
			return float(0)

func _get_input_port_type(port: int) -> PortType:
	match port:
		0:
			return PORT_TYPE_VECTOR_4D
		_:
			return PORT_TYPE_MAX;

func _get_input_port_name(port: int) -> String:
	match port:
		0:
			return "In"
		_:
			return "";

func _get_output_port_count() -> int:
	return 4

func _get_output_port_type(port: int) -> PortType:
	return PORT_TYPE_SCALAR

func _get_output_port_name(port: int) -> String:
	match port: 
		0:
			return "R"
		1:
			return "G"
		2:
			return "B"
		3:
			return "A"
		_:
			return ""
