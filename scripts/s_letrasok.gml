// arg0: texto a filtrar
// arg1: true si permitir espacios
// arg2: longitud maxima del texto
// ret: texto filtrado

var txt = "";
var ori = argument0;
var h;
while ori != "" {
    h = string_char_at(ori, 1);
    switch h {
        case 'a': case 'A': case 'b': case 'B': case 'c': case 'C':
        case 'd': case 'D': case 'e': case 'E': case 'f': case 'F':
        case 'g': case 'G': case 'h': case 'H': case 'i': case 'I':
        case 'j': case 'J': case 'k': case 'K': case 'l': case 'L':
        case 'm': case 'M': case 'n': case 'N': case 'o': case 'O':
        case 'p': case 'P': case 'q': case 'Q': case 'r': case 'R':
        case 's': case 'S': case 't': case 'T': case 'u': case 'U':
        case 'v': case 'V': case 'w': case 'W': case 'x': case 'X':
        case 'y': case 'Y': case 'z': case 'Z': case '0': case '1':
        case '2': case '3': case '4': case '5': case '6': case '7':
        case '8': case '9':
            txt += h;
            break;
        case ' ':
        case '.':
            if argument1 {
                txt += h; }
            break; }
    ori = string_delete(ori, 1, 1); }
if string_length(txt) > argument2 {
    txt = string_copy(txt, 1, argument2); }
return txt;

