//arg0: texto actualmente en la caja
//arg1: numero limite de caracteres del texto
//arg2: true si permitir otros simbolos
//ret: texto modificado por el teclado

var cadena = argument0;
var largo = string_length(cadena);
if keyboard_check_pressed(vk_backspace) or (keyboard_check(vk_backspace) and irandom(7) == 0)
{
    if largo <= 1
    {
        cadena = "";
    }
    else
    {
        cadena = string_copy(cadena, 1, largo - 1);
    }
}
else if keyboard_check_pressed(vk_delete)
{
    cadena = "";
}
else if largo < argument1 and keyboard_check_pressed(vk_anykey)
{
    switch(keyboard_key)
    {
        case vk_space:
            if argument2 {
                if keyboard_check(vk_shift) { cadena += ','; }
                else { cadena += ' '; } }
            break;
        case ord('0'): case vk_numpad0:
            if argument2 and keyboard_check(vk_shift) { cadena += '='; }
            else { cadena += '0'; }
            break;
        case ord('1'): case vk_numpad1:
            if argument2 and keyboard_check(vk_shift) { cadena += '!'; }
            else { cadena += '1'; }
            break;
        case ord('2'): case vk_numpad2:
            if argument2 and keyboard_check(vk_shift) { cadena += '@'; }
            else { cadena += '2'; }
            break;
        case ord('3'): case vk_numpad3:
            if argument2 and keyboard_check(vk_shift) { cadena += '_'; }
            else { cadena += '3'; }
            break;
        case ord('4'): case vk_numpad4:
            if argument2 and keyboard_check(vk_shift) { cadena += '$'; }
            else { cadena += '4'; }
            break;
        case ord('5'): case vk_numpad5:
            if argument2 and keyboard_check(vk_shift) { cadena += ':'; }
            else { cadena += '5'; }
            break;
        case ord('6'): case vk_numpad6:
            if argument2 and keyboard_check(vk_shift) { cadena += '?'; }
            else { cadena += '6'; }
            break;
        case ord('7'): case vk_numpad7:
            if argument2 and keyboard_check(vk_shift) { cadena += '/'; }
            else { cadena += '7'; }
            break;
        case ord('8'): case vk_numpad8:
            if argument2 and keyboard_check(vk_shift) { cadena += '('; }
            else { cadena += '8'; }
            break;
        case ord('9'): case vk_numpad9:
            if argument2 and keyboard_check(vk_shift) { cadena += ')'; }
            else { cadena += '9'; }
            break;
        case ord('A'):
            if keyboard_check(vk_shift) { cadena += 'A'; }
            else { cadena += 'a'; }
            break;
        case ord('B'):
            if keyboard_check(vk_shift) { cadena += 'B'; }
            else { cadena += 'b'; }
            break;
        case ord('C'):
            if keyboard_check(vk_shift) { cadena += 'C'; }
            else { cadena += 'c'; }
            break;
        case ord('D'):
            if keyboard_check(vk_shift) { cadena += 'D'; }
            else { cadena += 'd'; }
            break;
        case ord('E'):
            if keyboard_check(vk_shift) { cadena += 'E'; }
            else { cadena += 'e'; }
            break;
        case ord('F'):
            if keyboard_check(vk_shift) { cadena += 'F'; }
            else { cadena += 'f'; }
            break;
        case ord('G'):
            if keyboard_check(vk_shift) { cadena += 'G'; }
            else { cadena += 'g'; }
            break;
        case ord('H'):
            if keyboard_check(vk_shift) { cadena += 'H'; }
            else { cadena += 'h'; }
            break;
        case ord('I'):
            if keyboard_check(vk_shift) { cadena += 'I'; }
            else { cadena += 'i'; }
            break;
        case ord('J'):
            if keyboard_check(vk_shift) { cadena += 'J'; }
            else { cadena += 'j'; }
            break;
        case ord('K'):
            if keyboard_check(vk_shift) { cadena += 'K'; }
            else { cadena += 'k'; }
            break;
        case ord('L'):
            if keyboard_check(vk_shift) { cadena += 'L'; }
            else { cadena += 'l'; }
            break;
        case ord('M'):
            if keyboard_check(vk_shift) { cadena += 'M'; }
            else { cadena += 'm'; }
            break;
        case ord('N'):
            if keyboard_check(vk_shift) { cadena += 'N'; }
            else { cadena += 'n'; }
            break;
        case ord('O'):
            if keyboard_check(vk_shift) { cadena += 'O'; }
            else { cadena += 'o'; }
            break;
        case ord('P'):
            if keyboard_check(vk_shift) { cadena += 'P'; }
            else { cadena += 'p'; }
            break;
        case ord('Q'):
            if keyboard_check(vk_shift) { cadena += 'Q'; }
            else { cadena += 'q'; }
            break;
        case ord('R'):
            if keyboard_check(vk_shift) { cadena += 'R'; }
            else { cadena += 'r'; }
            break;
        case ord('S'):
            if keyboard_check(vk_shift) { cadena += 'S'; }
            else { cadena += 's'; }
            break;
        case ord('T'):
            if keyboard_check(vk_shift) { cadena += 'T'; }
            else { cadena += 't'; }
            break;
        case ord('U'):
            if keyboard_check(vk_shift) { cadena += 'U'; }
            else { cadena += 'u'; }
            break;
        case ord('V'):
            if keyboard_check(vk_shift) { cadena += 'V'; }
            else { cadena += 'v'; }
            break;
        case ord('W'):
            if keyboard_check(vk_shift) { cadena += 'W'; }
            else { cadena += 'w'; }
            break;
        case ord('X'):
            if keyboard_check(vk_shift) { cadena += 'X'; }
            else { cadena += 'x'; }
            break;
        case ord('Y'):
            if keyboard_check(vk_shift) { cadena += 'Y'; }
            else { cadena += 'y'; }
            break;
        case ord('Z'):
            if keyboard_check(vk_shift) { cadena += 'Z'; }
            else { cadena += 'z'; }
            break;
    }
}
return cadena;

