// ver si el jugador fue eliminado

with o_control {
    if estavivo {
        if dinero_riesgo >= 1 {
            s_eliminado("Eliminado, ciudad vendida"); }
        else if gente_actual == 0 {
            s_eliminado("Eliminado, sin habitantes"); }
        else if edificaciones_actual == 0 {
            s_eliminado("Eliminado, sin edificaciones"); } } }

