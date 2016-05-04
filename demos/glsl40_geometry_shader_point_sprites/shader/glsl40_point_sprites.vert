// Vertex Shader
//
// Como as tranform��es ser�o aplicadas somente no est�gio Tessellation Evaluation Shader, este
// vertex shader apenas passa os v�rtices de entrada adiante para o Tessellation Control Shader.
//
// Abril 2016 - Alex Frasson - afrasson@inf.ufsm.br

#version 400

layout (location = 0) in vec3 VertexPosition;

uniform mat4 ModelViewMatrix;
out vec3 vColor;

void main()
{	
	vColor = VertexPosition;
	gl_Position = ModelViewMatrix * vec4(VertexPosition,1.0);
}