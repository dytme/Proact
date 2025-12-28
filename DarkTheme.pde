// package proact.themes


// █▀▄ ▄▀█ █▀█ █▄▀   ▀█▀ █░█ █▀▀ █▀▄▀█ █▀▀
// █▄▀ █▀█ █▀▄ █░█   ░█░ █▀█ ██▄ █░▀░█ ██▄

// THIS BIT OF CODE IS NO LONGER FUNCTIONAL
// IT WAS A TEST FOR THE ARCHITECTURE OF A COMPLETE CUSTOM THEME
// IM KEEPING IT FOR DOCUMENTATION PURPOSES, AS THIS HAS SOME LOGIC WHICH IS REQUIRED TO IMPLEMENT FALLBACKS WHENEVER A THEME HAS A MISSING STYLE.

/*
class DarkThemeClass implements UITheme {

    UITheme fallback = DefaultTheme;


    // █▀▀ █▀█ ▄▀█ █▀▄▀█ █▀▀   █▀ ▀█▀ █▄█ █░░ █▀▀ █▀
    // █▀░ █▀▄ █▀█ █░▀░█ ██▄   ▄█ ░█░ ░█░ █▄▄ ██▄ ▄█

    FrameStyle frameDefault = new FrameStyle(
        // TOD: Add actual properties for the style lol
    ); 

    FrameStyle frameHovered = new FrameStyle(
        // TOD: Add actual properties for the style lol
    );


    // █▀█ █▀▀ ▀█▀ █░█ █▀█ █▄░█   █▀ ▀█▀ █▄█ █░░ █▀▀ █▀
    // █▀▄ ██▄ ░█░ █▄█ █▀▄ █░▀█   ▄█ ░█░ ░█░ █▄▄ ██▄ ▄█

    FrameStyle frame(UIState state) {
        switch (state) {
            // If there is no frameHovered style defined, then fallback to the one of the backup theme.
            case HOVERED: return frameHovered != null ? frameHovered : fallback.frame(state); 
            // Same for default-- in case someone defines a theme without any actual properties, so the program doesn't crash lol.
            default: return frameDefault != null ? frameDefault : fallback.frame(state);
        }
    }

}
*/