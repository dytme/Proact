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



    
    // █▀▀ █▀█ █░░ █▀█ █▀█   █▀█ ▄▀█ █░░ █░░ █▀▀ ▀█▀ █▀▀
    // █▄▄ █▄█ █▄▄ █▄█ █▀▄   █▀▀ █▀█ █▄▄ █▄▄ ██▄ ░█░ ██▄

    color darkGrey = #393942;
    color mediumGrey = #68686C;
    color lightGrey = #CACACA;
    color white = #FFFFFF;




    // ▒█▀▀▀ ▒█▀▀█ ░█▀▀█ ▒█▀▄▀█ ▒█▀▀▀ 　 ▒█▀▀▀█ ▀▀█▀▀ ▒█░░▒█ ▒█░░░ ▒█▀▀▀ ▒█▀▀▀█ 
    // ▒█▀▀▀ ▒█▄▄▀ ▒█▄▄█ ▒█▒█▒█ ▒█▀▀▀ 　 ░▀▀▀▄▄ ░▒█░░ ▒█▄▄▄█ ▒█░░░ ▒█▀▀▀ ░▀▀▀▄▄ 
    // ▒█░░░ ▒█░▒█ ▒█░▒█ ▒█░░▒█ ▒█▄▄▄ 　 ▒█▄▄▄█ ░▒█░░ ░░▒█░░ ▒█▄▄█ ▒█▄▄▄ ▒█▄▄▄█


    
    // █▀█ █▀▀ █▀▀ █░█ █░░ ▄▀█ █▀█   █▀▀ █▀█ ▄▀█ █▀▄▀█ █▀▀
    // █▀▄ ██▄ █▄█ █▄█ █▄▄ █▀█ █▀▄   █▀░ █▀▄ █▀█ █░▀░█ ██▄

    // As these also act as the fallback/default, all 4 styles have to be defined, even if they're one and the same.

    public final FrameStyle frameDefault = new FrameStyle(
        darkGrey,
        0,
        6,

        mediumGrey,
        0,
        1.5
    ); 

    public final FrameStyle frameHovered = frameDefault;

    public final FrameStyle frameActivated = frameDefault;

    public final FrameStyle frameDisabled = frameDefault;



    
    
    // █▀█ █▀▀ █▀▀ █░█ █░░ ▄▀█ █▀█   █▄▄ █░█ ▀█▀ ▀█▀ █▀█ █▄░█
    // █▀▄ ██▄ █▄█ █▄█ █▄▄ █▀█ █▀▄   █▄█ █▄█ ░█░ ░█░ █▄█ █░▀█


    public final FrameStyle buttonDefault = new FrameStyle(
        darkGrey,
        0,
        6,

        mediumGrey,
        0,
        1
    );

    public final FrameStyle buttonHovered = new FrameStyle(
        mediumGrey,
        0,
        6,

        mediumGrey,
        0,
        1
    );

    public final FrameStyle buttonActivated = new FrameStyle(
        lightGrey,
        0,
        6,

        lightGrey,
        0,
        0
    );

    public final FrameStyle buttonDisabled = buttonDefault; // buttonDisabled and buttonActive look the same. Difference will be visible through the actual TextLabel

    FrameStyle[] regularButtonPack = {
        buttonDefault,
        buttonHovered,
        buttonActivated,
        buttonDisabled
    };





    // █▀█ █▀█ █░█ █▄░█ █▀▄ █▀▀ █▀▄   █▄▄ █░█ ▀█▀ ▀█▀ █▀█ █▄░█
    // █▀▄ █▄█ █▄█ █░▀█ █▄▀ ██▄ █▄▀   █▄█ █▄█ ░█░ ░█░ █▄█ █░▀█

    







    // ▀▀█▀▀ ▒█▀▀▀ ▀▄▒▄▀ ▀▀█▀▀ ▒█░░░ ░█▀▀█ ▒█▀▀█ ▒█▀▀▀ ▒█░░░ 　 ▒█▀▀▀█ ▀▀█▀▀ ▒█░░▒█ ▒█░░░ ▒█▀▀▀ ▒█▀▀▀█ 
    // ░▒█░░ ▒█▀▀▀ ░▒█░░ ░▒█░░ ▒█░░░ ▒█▄▄█ ▒█▀▀▄ ▒█▀▀▀ ▒█░░░ 　 ░▀▀▀▄▄ ░▒█░░ ▒█▄▄▄█ ▒█░░░ ▒█▀▀▀ ░▀▀▀▄▄ 
    // ░▒█░░ ▒█▄▄▄ ▄▀▒▀▄ ░▒█░░ ▒█▄▄█ ▒█░▒█ ▒█▄▄█ ▒█▄▄▄ ▒█▄▄█ 　 ▒█▄▄▄█ ░▒█░░ ░░▒█░░ ▒█▄▄█ ▒█▄▄▄ ▒█▄▄▄█


    public final PFont regularFont = null; // null by default. If you want to utilize a specific font, then you have to load it in before any Proact logic takes place and manually assign this variable.
    public final PFont boldFont = null; // Same goes for a bolded piece of text.
    public final PFont italicFont = null; // ...

    // Because we're utilizing an interface here to allow any sort of theme to be applied, we can't simply extract variables like regularTextFont with a direct reference. We need a getter.
    // Even still, we're keeping the other values as public in case the user wants to easily access these by referencing this specific theme at some point.
    @Override public PFont regularFont() { return regularFont; }
    @Override public PFont boldFont() { return boldFont; }
    @Override public PFont italicFont() { return italicFont; }




    
    // █░█ █▀▀ ▄▀█ █▀▄ █ █▄░█ █▀▀
    // █▀█ ██▄ █▀█ █▄▀ █ █░▀█ █▄█

    public final TextLabelStyle headingLabel = new TextLabelStyle(
        null,

        24,

        white,
        regularFont,
        0
    );

    TextLabelStyle[] headingLabelPack = {
        headingLabel,
        headingLabel,
        headingLabel,
        headingLabel
    };

    

    // █▀█ ▄▀█ █▀█ ▄▀█ █▀▀ █▀█ ▄▀█ █▀█ █░█
    // █▀▀ █▀█ █▀▄ █▀█ █▄█ █▀▄ █▀█ █▀▀ █▀█

    // As this acts as the fallback/default for all TextLabels, each style needs to be independently defined, even if it's virtually the same as other ones.

    public final TextLabelStyle paragraphLabelDefault = new TextLabelStyle(
        null,

        16,

        white,
        regularFont,
        0
    );

    public final TextLabelStyle paragraphLabelHovered = paragraphLabelDefault;
    public final TextLabelStyle paragraphLabelActivated = paragraphLabelDefault;
    public final TextLabelStyle paragraphLabelDisabled = paragraphLabelDefault;

    TextLabelStyle[] paragraphLabelPack = {
        paragraphLabelDefault,
        paragraphLabelHovered,
        paragraphLabelActivated,
        paragraphLabelDisabled
    };



    // █▀▀ █▀█ █▀▄▀█ █▀▄▀█ █▀▀ █▄░█ ▀█▀
    // █▄▄ █▄█ █░▀░█ █░▀░█ ██▄ █░▀█ ░█░

    final TextLabelStyle commentLabel = new TextLabelStyle(
        null,

        16,

        lightGrey,
        regularFont,
        0
    );

    TextLabelStyle[] commentLabelPack = {
        commentLabel,
        commentLabel,
        commentLabel,
        commentLabel
    };



    // █▄▄ █░█ ▀█▀ ▀█▀ █▀█ █▄░█   █░░ ▄▀█ █▄▄ █▀▀ █░░ █▀
    // █▄█ █▄█ ░█░ ░█░ █▄█ █░▀█   █▄▄ █▀█ █▄█ ██▄ █▄▄ ▄█

    final TextLabelStyle buttonLabelDefault = new TextLabelStyle(
        null,

        16,

        mediumGrey,
        regularFont,
        0
    );

    final TextLabelStyle buttonLabelHovered = new TextLabelStyle(
        null,

        16,

        white,
        regularFont,
        0
    );

    final TextLabelStyle buttonLabelActivated = new TextLabelStyle(
        null,

        16,

        darkGrey,
        regularFont,
        0
    );

    final TextLabelStyle buttonLabelDisabled = buttonLabelActivated;

    TextLabelStyle[] buttonLabelPack = {
        buttonLabelDefault,
        buttonLabelHovered,
        buttonLabelActivated,
        buttonLabelDisabled
    };





    // ▒█▀▀▀█ ▒█░▒█ ░█▀▀█ ▒█▀▀█ ▒█▀▀▀ 　 ▒█░░░ ░█▀▀█ ▒█▀▀█ ▒█▀▀▀ ▒█░░░ 　 ▒█▀▀▀█ ▀▀█▀▀ ▒█░░▒█ ▒█░░░ ▒█▀▀▀ 
    // ░▀▀▀▄▄ ▒█▀▀█ ▒█▄▄█ ▒█▄▄█ ▒█▀▀▀ 　 ▒█░░░ ▒█▄▄█ ▒█▀▀▄ ▒█▀▀▀ ▒█░░░ 　 ░▀▀▀▄▄ ░▒█░░ ▒█▄▄▄█ ▒█░░░ ▒█▀▀▀ 
    // ▒█▄▄▄█ ▒█░▒█ ▒█░▒█ ▒█░░░ ▒█▄▄▄ 　 ▒█▄▄█ ▒█░▒█ ▒█▄▄█ ▒█▄▄▄ ▒█▄▄█ 　 ▒█▄▄▄█ ░▒█░░ ░░▒█░░ ▒█▄▄█ ▒█▄▄▄


    public final ShapeLabelStyle shapeLabelDefault = new ShapeLabelStyle(
        true,
        lightGrey,

        0.5,
        lightGrey
    );

    public final ShapeLabelStyle shapeLabelHovered = shapeLabelDefault;

    public final ShapeLabelStyle shapeLabelActivated = new ShapeLabelStyle(
        true,
        darkGrey,

        0.5,
        darkGrey
    );

    public final ShapeLabelStyle shapeLabelDisabled = shapeLabelActivated;  // By default, identical to the activated one















    // ░██████╗░███████╗████████╗████████╗███████╗██████╗░  ███╗░░░███╗███████╗████████╗██╗░░██╗░█████╗░██████╗░░██████╗
    // ██╔════╝░██╔════╝╚══██╔══╝╚══██╔══╝██╔════╝██╔══██╗  ████╗░████║██╔════╝╚══██╔══╝██║░░██║██╔══██╗██╔══██╗██╔════╝
    // ██║░░██╗░█████╗░░░░░██║░░░░░░██║░░░█████╗░░██████╔╝  ██╔████╔██║█████╗░░░░░██║░░░███████║██║░░██║██║░░██║╚█████╗░
    // ██║░░╚██╗██╔══╝░░░░░██║░░░░░░██║░░░██╔══╝░░██╔══██╗  ██║╚██╔╝██║██╔══╝░░░░░██║░░░██╔══██║██║░░██║██║░░██║░╚═══██╗
    // ╚██████╔╝███████╗░░░██║░░░░░░██║░░░███████╗██║░░██║  ██║░╚═╝░██║███████╗░░░██║░░░██║░░██║╚█████╔╝██████╔╝██████╔╝
    // ░╚═════╝░╚══════╝░░░╚═╝░░░░░░╚═╝░░░╚══════╝╚═╝░░╚═╝  ╚═╝░░░░░╚═╝╚══════╝░░░╚═╝░░░╚═╝░░╚═╝░╚════╝░╚═════╝░╚═════╝░



    

    // █▀▄ █▀▀ █▀▀ ▄▀█ █░█ █░░ ▀█▀   ░░▄▀   █▀▀ ▄▀█ █░░ █░░ █▄▄ ▄▀█ █▀▀ █▄▀ █▀
    // █▄▀ ██▄ █▀░ █▀█ █▄█ █▄▄ ░█░   ▄▀░░   █▀░ █▀█ █▄▄ █▄▄ █▄█ █▀█ █▄▄ █░█ ▄█

    
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
            case HOVERED: return paragraphLabelHovered;
            case ACTIVATED: return paragraphLabelActivated;
            case DISABLED: return paragraphLabelDisabled;
            default: return paragraphLabelDefault;
        }
    }


    public final ShapeLabelStyle shapeLabel(UIState state) { 
        switch (state) {
            case HOVERED: return shapeLabelHovered;
            case ACTIVATED: return shapeLabelActivated;
            case DISABLED: return shapeLabelDisabled;
            default: return shapeLabelDefault;
        }
    }



    

    // ▒█▀▀▀█ ▀▀█▀▀ ▒█░░▒█ ▒█░░░ ▒█▀▀▀ 　 ▒█▀▀█ ░█▀▀█ ▒█▀▀█ ▒█░▄▀ ▒█▀▀▀█ 
    // ░▀▀▀▄▄ ░▒█░░ ▒█▄▄▄█ ▒█░░░ ▒█▀▀▀ 　 ▒█▄▄█ ▒█▄▄█ ▒█░░░ ▒█▀▄░ ░▀▀▀▄▄ 
    // ▒█▄▄▄█ ░▒█░░ ░░▒█░░ ▒█▄▄█ ▒█▄▄▄ 　 ▒█░░░ ▒█░▒█ ▒█▄▄█ ▒█░▒█ ▒█▄▄▄█

    public final FrameStyle[] buttonStylePack(String stylePackName) { 
        switch (stylePackName.toUpperCase()) {
            case "ROUND": return regularButtonPack;
            default: return regularButtonPack;
        }
    }

    public final TextLabelStyle[] textLabelStylePack(String stylePackName) { 
        switch (stylePackName.toUpperCase()) {
            case "HEADING": return headingLabelPack;
            case "COMMENT": return commentLabelPack;
            case "BUTTON": return buttonLabelPack;
            default: return paragraphLabelPack;
        }
    }

}