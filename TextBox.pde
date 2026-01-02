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

public class TextBox extends UIElement implements Hoverable, Clickable, AcceptKeyboardInput {

    // Specific properties of a TextLabel
    int horizontalAllignment = CENTER;
    int verticalAllignment = CENTER;

    float textSize = -1; // -1 (or any negative number) implies that the field has not been overwritten by the user.
                         // If you want the label to use it's style's size, you can manually set this to something negative.
    String content = "";

    // Specific properties of a TextBox
    String placeholderContent = "Your Text Here!";
    boolean clearTextOnFocus = true;

    Runnable onHover;
    Runnable onClick;
    
    // TextLabel Styles
    TextLabelStyle textLabelDefault;
    TextLabelStyle textLabelHovered;
    TextLabelStyle textLabelActivated;
    TextLabelStyle textLabelDisabled;

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

                     // Hierarchy      // Style       // Render
    public TextBox(Container parent, UITheme theme, TextLabelStyle[] stylePack, boolean hasVisualFrame) {
        super(parent, theme, 1, 0, 0, 100, 50);

        // Only create a visualFrame element if the TextLabel has one.
        this.hasVisualFrame = hasVisualFrame;
        if (hasVisualFrame) {

            FrameStyle[] visualFrameStylePack; // Temporarily assign this variable

            if (stylePack == null) visualFrameStylePack = null; // if no style pack has been provided, give no style pack to visualFrame too.
            else visualFrameStylePack = stylePack[0].visualFrameStylePack; // Get the visualFrameStylePack from the default TextLabel style.

            visualFrame = new VisualFrame(parent, theme, visualFrameStylePack, 0, 0, xSize, ySize); // Parse that to the visualFrame element.

            // Add to the ArrayLists that handle event management
            Events.registerToClickable(this);
            Events.registerToHoverable(this);

        }

        if (stylePack != null) updateStylePack(stylePack);
        else updateStylePack();

        // Explicitly mention that this is to be considered a 'child' of it's parent, and not a building block of the parent itself.
        // println("my parent is: " + parent);
        this.parent.addChild(this);
    }


    
    // █▀ █▀▀ ▀█▀ ▀█▀ █▀▀ █▀█ █▀
    // ▄█ ██▄ ░█░ ░█░ ██▄ █▀▄ ▄█

    // Update the new styles after the theme of the element changes.
    void updateStylePack() {
        this.textLabelDefault = theme.textLabel(UIState.DEFAULT);
        this.textLabelHovered = theme.textLabel(UIState.HOVERED);
        this.textLabelActivated = theme.textLabel(UIState.ACTIVATED);
        this.textLabelDisabled = theme.textLabel(UIState.DISABLED);

        this.currentStyle = textLabelDefault;
    }

    // Apply a new style pack to the element.
    void updateStylePack(TextLabelStyle[] newStyles) {

        // We don't have to worry that much about missing styles.
        //  If a style is missing for a specific state, then it simply won't update from the previous, valid style.
        //  If no custom styles have been applied yet, then those are just the default ones.
        if (newStyles[0] != null) textLabelDefault = newStyles[0];
        if (newStyles[1] != null) textLabelHovered = newStyles[1];
        if (newStyles[2] != null) textLabelActivated = newStyles[2];
        if (newStyles[3] != null) textLabelDisabled = newStyles[3];
    }

    @Override public void setTheme(UITheme theme) {
        super.setTheme(theme);
        if (hasVisualFrame) visualFrame.setTheme(theme);
        updateStylePack();
    }


    public void setContent(String s) { this.content = s; }

    public void setTextSize(float s) { this.textSize = s; }


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


    public void setClearTextOnFocus(boolean b) {
        this.clearTextOnFocus = b;
    }


    public void setOnClick(Runnable m) { this.onClick = m; }
    public void setOnHover(Runnable m) { this.onHover = m; }

    public void mouseClicked() {
        this.content = "";

        if (onClick != null) onClick.run();
    }

    public void mouseHovered() {
        if (onHover != null) onHover.run();
    }


    public void keyboardInput(char key) {

        println("textbox received input: " + key);

        if (key != CODED) { // Avoid special characters (through processing)
            int code = (int) key;
            if (code == 8 && this.content.length() > 0) { // If backspace has been pressed
                this.content = this.content.substring(0, this.content.length() - 1);
            } else if ((code >= 0 && code <= 31) || code == 127) {
                return;
            } else this.content = (this.content + key);
            
        }
        
    }



    
    // █▀▀ █▀▀ ▀█▀ ▀█▀ █▀▀ █▀█ █▀
    // █▄█ ██▄ ░█░ ░█░ ██▄ █▀▄ ▄█

    public String getContent() {
        return this.content;
    }




    
    // █▀█ █▀▀ █▄░█ █▀▄ █▀▀ █▀█
    // █▀▄ ██▄ █░▀█ █▄▀ ██▄ █▀▄

    @Override void render() {

        // print("rendered! through papplet instance: " + applet);
        // print(this + " has state: " + this.state);

        // Update the current visual style based on the state.
        if (state != null) { // Update current style based on the currently applied state
            switch (state) {
            case HOVERED:
                currentStyle = textLabelHovered;
                break;
            case ACTIVATED:
                currentStyle = textLabelActivated;
                break;
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
            visualFrame.setSize(xSize, ySize);
            visualFrame.setAnchorPoints(xAnchor,yAnchor);
            visualFrame.setAbsolute(xAbs,yAbs);
            visualFrame.setUIState(this.state);
            visualFrame.render();
        }

        
        // Higher Level Code, Specific to the TextLabel

        // If the textSize property is not null, then it means the property was overwritten.
        // otherwise, use the default one given by the currentStyle.
        if (this.textSize < 0) applet.textSize(currentStyle.textSize);
        else applet.textSize(this.textSize);

        applet.textAlign(horizontalAllignment, verticalAllignment);


        // Update font either through the style, or by the overwritten variable.
        if (currentFont == null && currentStyle.fontStyle != null) applet.textFont(currentStyle.fontStyle);
        else if (currentFont != null) applet.textFont(currentFont);


        // If there is some content (text already written in the TextBox) then show that
        if (content.length() > 0) {

            applet.fill(color(
                red(currentStyle.textColor),
                green(currentStyle.textColor),
                blue(currentStyle.textColor),
                map(currentStyle.textTransparency, 0, 1, 255, 0)
            ));

            applet.text(content, xAbs, yAbs, xSize, ySize);

        } else { // Otherwise, show the (more transparent) placeholder.

            applet.fill(color(
                red(currentStyle.textColor),
                green(currentStyle.textColor),
                blue(currentStyle.textColor),
                map(currentStyle.textTransparency, 0, 1, 150, 0)
            ));

            applet.text(placeholderContent, xAbs, yAbs, xSize, ySize);
        }

        
        

    }

}