// package proact.themes

/*

██████╗░███████╗███████╗░█████╗░██╗░░░██╗██╗░░░░░████████╗  ████████╗██╗░░██╗███████╗███╗░░░███╗███████╗
██╔══██╗██╔════╝██╔════╝██╔══██╗██║░░░██║██║░░░░░╚══██╔══╝  ╚══██╔══╝██║░░██║██╔════╝████╗░████║██╔════╝
██║░░██║█████╗░░█████╗░░███████║██║░░░██║██║░░░░░░░░██║░░░  ░░░██║░░░███████║█████╗░░██╔████╔██║█████╗░░
██║░░██║██╔══╝░░██╔══╝░░██╔══██║██║░░░██║██║░░░░░░░░██║░░░  ░░░██║░░░██╔══██║██╔══╝░░██║╚██╔╝██║██╔══╝░░
██████╔╝███████╗██║░░░░░██║░░██║╚██████╔╝███████╗░░░██║░░░  ░░░██║░░░██║░░██║███████╗██║░╚═╝░██║███████╗
╚═════╝░╚══════╝╚═╝░░░░░╚═╝░░╚═╝░╚═════╝░╚══════╝░░░╚═╝░░░  ░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝╚══════╝

*/

public class DefaultThemeClass implements UITheme {



    // █▀▀ █▀█ ▄▀█ █▀▄▀█ █▀▀   █▀ ▀█▀ █▄█ █░░ █▀▀ █▀
    // █▀░ █▀▄ █▀█ █░▀░█ ██▄   ▄█ ░█░ ░█░ █▄▄ ██▄ ▄█

    public final FrameStyle frameDefault = new FrameStyle(
        #D9D9D9,
        0,
        4,

        #000000,
        0,
        1
    ); 

    public final FrameStyle frameHovered = new FrameStyle(
        #999999,
        0,
        4,

        #000000,
        0,
        1
    );

    public final FrameStyle frameActivated = new FrameStyle(
        #FFFFFF,
        0,
        4,

        #000000,
        0,
        1
    );

    public final FrameStyle frameDisabled = frameDefault;

    

    // ▀█▀ █▀▀ ▀▄▀ ▀█▀ █░░ ▄▀█ █▄▄ █▀▀ █░░   █▀ ▀█▀ █▄█ █░░ █▀▀ █▀
    // ░█░ ██▄ █░█ ░█░ █▄▄ █▀█ █▄█ ██▄ █▄▄   ▄█ ░█░ ░█░ █▄▄ ██▄ ▄█

    public final PFont regularFont = null; // null by default. If you want to utilize a specific font, then you have to load it in before any Proact logic takes place and manually assign this variable.
    public final PFont boldFont = null; // Same goes for a bolded piece of text.
    public final PFont italicFont = null;

    // Because we're utilizing an interface here to allow any sort of theme to be applied, we can't simply extract variables like regularTextFont with a direct reference. We need a getter.
    @Override public PFont regularFont() { return regularFont; }
    @Override public PFont boldFont() { return boldFont; }
    @Override public PFont italicFont() { return italicFont; }

    public final TextLabelStyle textLabelDefault = new TextLabelStyle(
        frameDefault,
        #000000,
        0
    );

    public final TextLabelStyle textLabelDisabled = new TextLabelStyle(
        frameDefault,
        #666666,
        0
    );



    // █▄▄ █░█ ▀█▀ ▀█▀ █▀█ █▄░█   █▀ ▀█▀ █▄█ █░░ █▀▀ █▀
    // █▄█ █▄█ ░█░ ░█░ █▄█ █░▀█   ▄█ ░█░ ░█░ █▄▄ ██▄ ▄█

    // color backgroundColor, float backgroundTransparency, int cornerRadius, color strokeColor, float strokeTransparency, float strokeWeight
    public final FrameStyle buttonDefault = new FrameStyle(
        #FFFFFF,
        0,
        4,

        #FFFFFF,
        1,
        0
    );

    public final FrameStyle buttonHovered = new FrameStyle(
        #D9D9D9,
        0,
        4,

        #FFFFFF,
        0,
        1
    );

    public final FrameStyle buttonActivated = new FrameStyle(
        #999999,
        0,
        4,

        #999999,
        1,
        0
    );

    public final FrameStyle buttonDisabled = buttonActivated; // buttonDisabled and buttonActive look the same. Difference will be visible through the actual TextLabel




    // ▒█▀▀█ ▒█▀▀▀ ▀▀█▀▀ ▒█░▒█ ▒█▀▀█ ▒█▄░▒█ 　 ▒█▀▀▀█ ▀▀█▀▀ ▒█░░▒█ ▒█░░░ ▒█▀▀▀ ▒█▀▀▀█ 
    // ▒█▄▄▀ ▒█▀▀▀ ░▒█░░ ▒█░▒█ ▒█▄▄▀ ▒█▒█▒█ 　 ░▀▀▀▄▄ ░▒█░░ ▒█▄▄▄█ ▒█░░░ ▒█▀▀▀ ░▀▀▀▄▄ 
    // ▒█░▒█ ▒█▄▄▄ ░▒█░░ ░▀▄▄▀ ▒█░▒█ ▒█░░▀█ 　 ▒█▄▄▄█ ░▒█░░ ░░▒█░░ ▒█▄▄█ ▒█▄▄▄ ▒█▄▄▄█
    
    public final FrameStyle frame(UIState state) { 
        switch (state) {
            case HOVERED: return frameHovered;
            case ACTIVATED: return frameActivated;
            case DISABLED: return frameDisabled;
            default: return frameDefault;
        }
    }

    public final TextLabelStyle textLabel(UIState state) { 
        switch (state) {
            case DISABLED: return textLabelDisabled;
            default: return textLabelDefault;
        }
    }

    public final FrameStyle button(UIState state) { 
        switch (state) {
            case HOVERED: return buttonHovered;
            case ACTIVATED: return buttonActivated;
            case DISABLED: return buttonDisabled;
            default: return buttonDefault;
        }
    }

}