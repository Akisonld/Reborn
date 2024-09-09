#region Controles
key_right = keyboard_check(ord("D")) 
key_left = keyboard_check(ord("A"))
key_jump = keyboard_check(ord("W"))
#endregion

#region Movimentacao
var _move = key_right - key_left;
hspeed = _move * spd;
vspeed += gravity;  // Aplicar gravidade ao movimento vertical

if (hspeed != 0) image_xscale = sign(hspeed); { // Inverter a direção do sprite ao se mover
}
// Colisão horizontal
if place_meeting (x + hspeed, y, oparede)	  // Verifica colisão com o objeto sparrede
{
    while (!place_meeting(x + sign(hspeed), y, oparede))  // Ajusta até a posição antes da colisão
    {
        x = x + sign(hspeed);
    }
    hspeed = 0;  // Zera a velocidade horizontal após a colisão
}
x = x + hspeed;
// JUMP
if (key_jump && place_meeting(x, y + 1, oparede)) { //w faz pular
    vspeed = -10;  // Define a força do pulo
}

x += hspeed;  // Atualiza a posição horizontal


// Colisão vertical
if place_meeting(x, y + vspeed, oparede)  // Verifica colisão com o objeto sparrede
{
    while (!place_meeting(x, y + sign(vspeed), oparede))  // Ajusta até a posição antes da colisão
    {
        y = y + sign(vspeed);
    }
    vspeed = 0;  // Zera a velocidade vertical após a colisão
}
y += vspeed;  // Atualiza a posição vertical
#endregion

#region Movimento
if keyboard_check(ord("A")){
x-=spd;
}

if keyboard_check(ord("S")){
y+=spd;
}
if keyboard_check(ord("D")){
x+=spd;
}