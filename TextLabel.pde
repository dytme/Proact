// package proact.ui

/*

████████╗███████╗██╗░░██╗████████╗██╗░░░░░░█████╗░██████╗░███████╗██╗░░░░░
╚══██╔══╝██╔════╝╚██╗██╔╝╚══██╔══╝██║░░░░░██╔══██╗██╔══██╗██╔════╝██║░░░░░
░░░██║░░░█████╗░░░╚███╔╝░░░░██║░░░██║░░░░░███████║██████╦╝█████╗░░██║░░░░░
░░░██║░░░██╔══╝░░░██╔██╗░░░░██║░░░██║░░░░░██╔══██║██╔══██╗██╔══╝░░██║░░░░░
░░░██║░░░███████╗██╔╝╚██╗░░░██║░░░███████╗██║░░██║██████╦╝███████╗███████╗
░░░╚═╝░░░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░╚══════╝╚═╝░░╚═╝╚═════╝░╚══════╝╚══════╝

Frame that also has a text element within it.

*/

public class TextLabel extends UIElement {

    // Specific properties of a TextLabel
    int horizontalAllignment = CENTER;
    int verticalAllignment = CENTER;

    float textSize = 16;
    String content = "TextLabel";
    
    // TextLabel Styles
    TextLabelStyle textLabelDefault = theme.textLabel(UIState.DEFAULT);
    TextLabelStyle textLabelDisabled = theme.textLabel(UIState.DISABLED);
    TextLabelStyle currentStyle = textLabelDefault;

    // Font Styles
    PFont regularFont = theme.regularFont();
    PFont boldFont = theme.boldFont();
    PFont italicFont = theme.italicFont();
    PFont currentFont;


    // Visual Frame element
    VisualFrame visualFrame;
    final boolean hasVisualFrame; // Final because a label cannot have a VisualFrame added to it once it has been initialized.



    // █▀▀ █▀█ █▄░█ █▀ ▀█▀ █▀█ █░█ █▀▀ ▀█▀ █▀█ █▀█
    // █▄▄ █▄█ █░▀█ ▄█ ░█░ █▀▄ █▄█ █▄▄ ░█░ █▄█ █▀▄

                     // Hierarchy      // Style       // Render                           // Positioning          // Size
    public TextLabel(Container parent, UITheme theme, boolean hasVisualFrame, int zIndex, float xPos, float yPos, float xSize, float ySize) {
        super(parent, theme, zIndex, xPos, yPos, xSize, ySize);

        // Only create a visualFrame element if the TextLabel has one.
        this.hasVisualFrame = hasVisualFrame;
        if (hasVisualFrame) {
            visualFrame = new VisualFrame(parent, theme, 0, 0, xSize, ySize);
        }

        // Explicitly mention that this is to be considered a 'child' of it's parent, and not a building block of the parent itself.
        // println("my parent is: " + parent);
        this.parent.addChild(this);
    }


    
    // █▀ █▀▀ ▀█▀ ▀█▀ █▀▀ █▀█ █▀
    // ▄█ ██▄ ░█░ ░█░ ██▄ █▀▄ ▄█

    public void setContent(String s) { this.content = s; }

    public void setTextSize(float s) { this.textSize = s; }

    @Override public void setTheme(UITheme theme) {
        super.setTheme(theme);
        if (hasVisualFrame) visualFrame.setTheme(theme);
    }

    void setFontStyle(FontStyle fontStyle) {
        if (fontStyle != null) { // Update current style based on the currently applied state
            switch (fontStyle) {
            case BOLD:
                currentFont = boldFont;
                break;
            case ITALIC:
                currentFont = italicFont;
                break;
            default:
                currentFont = regularFont;
                break;
            }
        }
    }


    
    // █▀█ █▀▀ █▄░█ █▀▄ █▀▀ █▀█
    // █▀▄ ██▄ █░▀█ █▄▀ ██▄ █▀▄

    @Override void render() {

        // print("rendered! through papplet instance: " + applet);

        // Update the current visual style based on the state.
        if (state != null) { // Update current style based on the currently applied state
            switch (state) {
            case DISABLED:
                currentStyle = textLabelDisabled;
                break;
            default:
                currentStyle = textLabelDefault;
                break;
            }
        }

        // Communicate the current state of the ContainerFrame to the VisualFrame and render it accordingly.
        if (hasVisualFrame) {
            visualFrame.setAnchorPoints(xAnchor,yAnchor);
            visualFrame.setAbsolute(xAbs,yAbs);
            visualFrame.setUIState(this.state);
            visualFrame.render();
        }

        
        // Higher Level Code, Specific to the TextLabel

        if (currentFont != null) applet.textFont(currentFont); // Only if currentFont is null (one has been set through a custom theme), will this bit of code attempt to set the font of the sketch to the new value.

        applet.fill(color(
            red(currentStyle.textColor),
            green(currentStyle.textColor),
            blue(currentStyle.textColor),
            map(currentStyle.textTransparency, 0, 1, 255, 0)
        ));

        applet.textSize(textSize);
        applet.textAlign(horizontalAllignment, verticalAllignment);
        applet.text(content, xAbs, yAbs, xSize, ySize);
        // applet.text(content, 300, 200);
        

    }

}