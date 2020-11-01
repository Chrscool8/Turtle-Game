///draw_subdivided_floor(x, y, size, subdiv, tex)
var xx     = argument[0];
var yy     = argument[1];
var size   = argument[2];
var subdiv = argument[3]*2;
var _tex    = argument[4];

for (var i=0; i<subdiv; i+=1)
{
    for (var j=0; j<subdiv; j+=1)
    {
        d3d_primitive_begin_texture(pr_trianglestrip, _tex);
        d3d_vertex_texture(xx+i/subdiv*size, yy+j/subdiv*size, 0, i/subdiv, j/subdiv);
        d3d_vertex_texture(xx+i/subdiv*size, yy+(j+1)/subdiv*size, 0, i/subdiv, (j+1)/subdiv);
        d3d_vertex_texture(xx+(i+1)/subdiv*size, yy+j/subdiv*size, 0, (i+1)/subdiv, j/subdiv);
        d3d_vertex_texture(xx+(i+1)/subdiv*size, yy+(j+1)/subdiv*size, 0, (i+1)/subdiv, (j+1)/subdiv);
        d3d_primitive_end();
        
        /*if (!keyboard_check(vk_alt))
        {
            d3d_primitive_begin(pr_linestrip);
            d3d_vertex_colour(xx+i/subdiv*size, yy+j/subdiv*size, 0, c_black, 1);
            d3d_vertex_colour(xx+i/subdiv*size, yy+(j+1)/subdiv*size, 0, c_black, 1);
            d3d_vertex_colour(xx+(i+1)/subdiv*size, yy+j/subdiv*size, 0, c_black, 1);
            d3d_vertex_colour(xx+(i+1)/subdiv*size, yy+(j+1)/subdiv*size, 0, c_black, 1);
            d3d_primitive_end();
        }*/
    }
}

