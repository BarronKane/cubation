@tool
extends VisualShaderNodeCustom
class_name VisualShaderNodePolygon

func _get_name() -> String:
	return "Polygon"

func _get_category():
	return "UV"

func _get_code(input_vars, output_vars, mode, type):
	var pi: float = 3.14159265859
	return """
	float pi = float(%s);
	float aWidth = %s * cos(pi / %s);
	float aHeight = %s * cos(pi / %s);
	vec2 uv = (%s * float(2) - float(1)) / vec2(aWidth, aHeight);
	uv.y *= float(-1.0);
	float pCoord = atan(uv.x, uv.y);
	float r = float(2) * pi / %s;
	float distance = cos(floor(0.5 + pCoord / r) * r - pCoord) * length(uv);
	float resolve = (float(1) - distance) / fwidth(distance);
	%s = clamp(resolve, float(0), float(1));
	""" % [pi, input_vars[2], input_vars[1], input_vars[3], input_vars[1], input_vars[0], input_vars[1], output_vars[0]]

func _get_default_input_port(type):
	return VisualShaderNode.PORT_TYPE_VECTOR_2D

func _get_description():
	return "Generates a regular polygon shape based on input UV at specified sizes."

func _get_input_port_count():
	return 4

func _get_input_port_default_value(port: int) -> Variant:
	match port:
		0:
			return Vector2(0, 0)
		1:
			return float(0)
		2:
			return float(0)
		3:
			return float(0)
		_:
			return float(0)

func _get_input_port_type(port: int) -> PortType:
	match port:
		0:
			return PORT_TYPE_VECTOR_2D
		1:
			return PORT_TYPE_SCALAR
		2:
			return PORT_TYPE_SCALAR
		3:
			return PORT_TYPE_SCALAR
		_:
			return PORT_TYPE_MAX;

func _get_input_port_name(port: int) -> String:
	match port:
		0:
			return "UV"
		1:
			return "Sides"
		2:
			return "Width"
		3:
			return "Height"
		_:
			return "";

func _get_output_port_count() -> int:
	return 1

func _get_output_port_type(port: int) -> PortType:
	return PORT_TYPE_SCALAR

func _get_output_port_name(port: int) -> String:
	return "Out"
