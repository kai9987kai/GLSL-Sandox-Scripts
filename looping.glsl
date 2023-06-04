precision mediump float;

uniform float time;
uniform vec2 resolution;

void main() {
    vec2 uv = gl_FragCoord.xy / resolution.xy;
    uv = abs(0.5 - uv) * 2.0; // Mirror effect
    float freq = 10.0;
    float speed = 2.0;
    float amp = 0.1;
    float wave = sin(uv.x * freq + time * speed) * amp;
    float dist = abs(uv.y - wave);
    float intensity = 1.0 - smoothstep(0.02, 0.03, dist);
    vec3 color = vec3(intensity, uv.y + wave, uv.x - wave);

    // Add a 3D effect by modifying the color based on the wave height
    color *= 1.0 - wave;

    gl_FragColor = vec4(color, 1.0);
}
