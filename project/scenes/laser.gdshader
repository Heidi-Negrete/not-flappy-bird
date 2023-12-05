shader_type canvas_item;

uniform float flashState : hint_range(0.0, 1.0) = 0.0;
uniform vec4 flashColor : source_color;

void fragment() {
	COLOR = texture(TEXTURE, UV);
	if (COLOR.r + COLOR.g + COLOR.b < 1.5)
		COLOR.rgb = mix(COLOR, flashColor, flashState).rgb;
}