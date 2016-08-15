/*
	Simplesmente aplica a cor recebida.
	Note que ela foi interpolada entre o VS e FS.
*/

#version 400

in vec3 Color;

void main() 
{
    gl_FragColor = vec4(Color, 1.0);
}
