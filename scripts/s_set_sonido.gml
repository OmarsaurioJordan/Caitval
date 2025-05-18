// pone el sonido en valores deseados

audio_stop_sound(a_musica1);
audio_stop_sound(a_musica2);
switch o_control.sonido {
    case m_mute:
        audio_master_gain(0);
        break;
    case m_efectos:
        audio_master_gain(1);
        break;
    case m_musica:
        if instance_exists(o_menu) {
            audio_play_sound(a_musica1, 100, true); }
        else {
            audio_play_sound(a_musica2, 100, true); }
        break; }

