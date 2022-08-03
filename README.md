# godot-glitch-fade

Download as a zip and import

shader code:

```glsl
shader_type canvas_item;
uniform bool horizontal;
uniform sampler2D Noise : hint_albedo;
uniform float distort;



void vertex() {
// Output:0

}

void fragment() {
// Input:22
	vec3 n_out22p0 = vec3(UV, 0.0);

// BooleanUniform:20
	bool n_out20p0 = horizontal;

// Input:2
	vec3 n_out2p0 = vec3(UV, 0.0);

// Expression:27
	vec3 n_out27p0;
	n_out27p0 = vec3(0.0, 0.0, 0.0);
	{
		if(n_out20p0) n_out27p0 = vec3(0., n_out2p0.y, 0.);
		else n_out27p0 = vec3(n_out2p0.x, 0., 0.);
	}

// Texture:8
	vec3 n_out8p0;
	float n_out8p1;
	{
		vec4 Noise_tex_read = texture(Noise, n_out27p0.xy);
		n_out8p0 = Noise_tex_read.rgb;
		n_out8p1 = Noise_tex_read.a;
	}

// VectorDecompose:9
	float n_out9p0 = n_out8p0.x;
	float n_out9p1 = n_out8p0.y;
	float n_out9p2 = n_out8p0.z;

// ScalarUniform:14
	float n_out14p0 = distort;

// Expression:28
	float n_out28p0;
	n_out28p0 = 0.0;
	{
		n_out28p0 = pow(n_out9p0, 1./abs(n_out14p0)-1.)
	}

// ScalarFunc:18
	float n_out18p0 = sign(n_out14p0);

// ScalarOp:17
	float n_out17p0 = n_out28p0 * n_out18p0;

// VectorCompose:6
	float n_in6p1 = 0.00000;
	float n_in6p2 = 0.00000;
	vec3 n_out6p0 = vec3(n_out17p0, n_in6p1, n_in6p2);

// VectorCompose:26
	float n_in26p0 = 0.00000;
	float n_in26p2 = 0.00000;
	vec3 n_out26p0 = vec3(n_in26p0, n_out17p0, n_in26p2);

// VectorSwitch:25
	vec3 n_out25p0;
	if(n_out20p0)
	{
		n_out25p0 = n_out6p0;
	}
	else
	{
		n_out25p0 = n_out26p0;
	}

// VectorOp:5
	vec3 n_out5p0 = n_out22p0 + n_out25p0;

// Input:3

// Texture:4
	vec3 n_out4p0;
	float n_out4p1;
	{
		vec4 TEXTURE_tex_read = texture(TEXTURE, n_out5p0.xy);
		n_out4p0 = TEXTURE_tex_read.rgb;
		n_out4p1 = TEXTURE_tex_read.a;
	}

// Output:0
	COLOR.rgb = n_out4p0;
	COLOR.a = n_out4p1;

}

void light() {
// Output:0

}
```
