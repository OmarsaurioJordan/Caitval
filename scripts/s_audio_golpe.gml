// arg0: true si es un humano, false monstruo

if random(1) < m_soniazar {
    var aud;
    if argument0 {
        aud = choose(a_golpe1, a_golpe2, a_golpe3,
            a_golpe4, a_golpe5, a_golpe6); }
    else {
        aud = choose(a_golpe7, a_golpe8,
            a_golpe9, a_golpe10); }
    audio_play_sound(aud, 18, false); }

