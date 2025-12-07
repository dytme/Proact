/*

████████╗██╗░░██╗███████╗███╗░░░███╗███████╗░██████╗
╚══██╔══╝██║░░██║██╔════╝████╗░████║██╔════╝██╔════╝
░░░██║░░░███████║█████╗░░██╔████╔██║█████╗░░╚█████╗░
░░░██║░░░██╔══██║██╔══╝░░██║╚██╔╝██║██╔══╝░░░╚═══██╗
░░░██║░░░██║░░██║███████╗██║░╚═╝░██║███████╗██████╔╝
░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝╚══════╝╚═════╝░

Handles the creation of themes and individual, stated-controlled styles.

*/






// ▒█░▒█ ▀█▀ 　 ▀▀█▀▀ ▒█░▒█ ▒█▀▀▀ ▒█▀▄▀█ ▒█▀▀▀ ▒█▀▀▀█ 
// ▒█░▒█ ▒█░ 　 ░▒█░░ ▒█▀▀█ ▒█▀▀▀ ▒█▒█▒█ ▒█▀▀▀ ░▀▀▀▄▄ 
// ░▀▄▄▀ ▄█▄ 　 ░▒█░░ ▒█░▒█ ▒█▄▄▄ ▒█░░▒█ ▒█▄▄▄ ▒█▄▄▄█


// Shared Interface
// Allows individual elements to request information about any theme
interface UITheme {
    FrameStyle frame(UIState state);
}




// █▀▄ █▀▀ █▀▀ ▄▀█ █░█ █░░ ▀█▀   ▀█▀ █░█ █▀▀ █▀▄▀█ █▀▀
// █▄▀ ██▄ █▀░ █▀█ █▄█ █▄▄ ░█░   ░█░ █▀█ ██▄ █░▀░█ ██▄

class DefaultThemeClass implements UITheme {

    // █▀▀ █▀█ ▄▀█ █▀▄▀█ █▀▀   █▀ ▀█▀ █▄█ █░░ █▀▀ █▀
    // █▀░ █▀▄ █▀█ █░▀░█ ██▄   ▄█ ░█░ ░█░ █▄▄ ██▄ ▄█

    FrameStyle frameDefault = new FrameStyle(
        // TODO: Add actual properties for the style lol
    ); 

    FrameStyle frameHovered = new FrameStyle(
        // TODO: Add actual properties for the style lol
    );


    // █▀█ █▀▀ ▀█▀ █░█ █▀█ █▄░█   █▀ ▀█▀ █▄█ █░░ █▀▀ █▀
    // █▀▄ ██▄ ░█░ █▄█ █▀▄ █░▀█   ▄█ ░█░ ░█░ █▄▄ ██▄ ▄█

    FrameStyle frame(UIState state) { 
        switch (state) {
            case HOVERED: return frameHovered;
            default: return frameDefault;
        }
    }

}




// █▀▄ ▄▀█ █▀█ █▄▀   ▀█▀ █░█ █▀▀ █▀▄▀█ █▀▀
// █▄▀ █▀█ █▀▄ █░█   ░█░ █▀█ ██▄ █░▀░█ ██▄

class DarkThemeClass implements UITheme {

    UITheme fallback = DefaultTheme;


    // █▀▀ █▀█ ▄▀█ █▀▄▀█ █▀▀   █▀ ▀█▀ █▄█ █░░ █▀▀ █▀
    // █▀░ █▀▄ █▀█ █░▀░█ ██▄   ▄█ ░█░ ░█░ █▄▄ ██▄ ▄█

    FrameStyle frameDefault = new FrameStyle(
        // TODO: Add actual properties for the style lol
    ); 

    FrameStyle frameHovered = new FrameStyle(
        // TODO: Add actual properties for the style lol
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









// ▀█▀ ▒█▄░▒█ ▒█▀▀▄ ▀█▀ ▒█░░▒█ ▀█▀ ▒█▀▀▄ ▒█░▒█ ░█▀▀█ ▒█░░░ 　 ▒█▀▀▀ ▒█░░░ ▒█▀▀▀ ▒█▀▄▀█ ▒█▀▀▀ ▒█▄░▒█ ▀▀█▀▀ 　 ▒█▀▀▀█ ▀▀█▀▀ ▒█░░▒█ ▒█░░░ ▒█▀▀▀ ▒█▀▀▀█ 
// ▒█░ ▒█▒█▒█ ▒█░▒█ ▒█░ ░▒█▒█░ ▒█░ ▒█░▒█ ▒█░▒█ ▒█▄▄█ ▒█░░░ 　 ▒█▀▀▀ ▒█░░░ ▒█▀▀▀ ▒█▒█▒█ ▒█▀▀▀ ▒█▒█▒█ ░▒█░░ 　 ░▀▀▀▄▄ ░▒█░░ ▒█▄▄▄█ ▒█░░░ ▒█▀▀▀ ░▀▀▀▄▄ 
// ▄█▄ ▒█░░▀█ ▒█▄▄▀ ▄█▄ ░░▀▄▀░ ▄█▄ ▒█▄▄▀ ░▀▄▄▀ ▒█░▒█ ▒█▄▄█ 　 ▒█▄▄▄ ▒█▄▄█ ▒█▄▄▄ ▒█░░▒█ ▒█▄▄▄ ▒█░░▀█ ░▒█░░ 　 ▒█▄▄▄█ ░▒█░░ ░░▒█░░ ▒█▄▄█ ▒█▄▄▄ ▒█▄▄▄█

// Handle (state-driven) styles for different elements

class FrameStyle {

    // Background
    color backgroundColor = #D9D9D9;
    float backgroundTransparency = 0;
    int cornerRadius = 4;

    // Stroke
    float strokeWidth = 1;
    color strokeColor = #000000;
    float strokeTransparency = 0;
    
    // TODO: Add all of the fields above as fields in (overloaded?) constructors
    FrameStyle() {

    }

}