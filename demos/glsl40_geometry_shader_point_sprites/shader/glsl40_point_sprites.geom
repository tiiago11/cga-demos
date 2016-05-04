// Tessellation Control Shader
//
// Neste est�gio � definido o n�mero de subdivis�es para cada aresta e para o centro do Quad.
// Lembrete: o Tessellation Control Shader � executado para cada v�rtice do Patch. Isto faz com que
// o gl_TessLevelOuter e o gl_TessLevelInner sejam setados 4 vezes por Patch (nosso patch possui
// 4 v�rtices). � poss�vel utilizar o gl_InvocationID (id �nico para cada v�rtice do patch) para modificar
// essas vari�veis apenas uma vez por Patch.
//
// Ap�s este est�gio a GPU ir� gerar novos v�rtices que seram alimentados para o Tessellation
// Evaluation Shader.
//
// Abril 2016 - Alex Frasson - afrasson@inf.ufsm.br

#version 400

layout( points ) in;
layout( triangle_strip, max_vertices = 4 ) out;

uniform mat4 ProjectionMatrix;

in vec3 vColor[];

out vec2 TexCoord;
out vec3 gColor;

void main()
{
	float size = 0.15;

	mat4 m = ProjectionMatrix; // Reassign for brevity
	
	gl_Position = m * (vec4(-size,-size,0.0,0.0) + gl_in[0].gl_Position);
	TexCoord = vec2(0.0,0.0);
	gColor = vColor[0];
	EmitVertex();
	
	gl_Position = m * (vec4(size,-size,0.0,0.0) +
	gl_in[0].gl_Position);
	TexCoord = vec2(1.0,0.0);
	gColor = vColor[0];
	EmitVertex();
	
	gl_Position = m * (vec4(-size,size,0.0,0.0) +
	gl_in[0].gl_Position);
	TexCoord = vec2(0.0,1.0);
	gColor = vColor[0];
	EmitVertex();
	
	gl_Position = m * (vec4(size,size,0.0,0.0) +
	gl_in[0].gl_Position);
	TexCoord = vec2(1.0,1.0);
	gColor = vColor[0];
	EmitVertex();

	EndPrimitive();
}