// package proact.ui

/*

██╗░░░██╗██╗░██████╗██╗░░░██╗░█████╗░██╗░░░░░  ███████╗██████╗░░█████╗░███╗░░░███╗███████╗
██║░░░██║██║██╔════╝██║░░░██║██╔══██╗██║░░░░░  ██╔════╝██╔══██╗██╔══██╗████╗░████║██╔════╝
╚██╗░██╔╝██║╚█████╗░██║░░░██║███████║██║░░░░░  █████╗░░██████╔╝███████║██╔████╔██║█████╗░░
░╚████╔╝░██║░╚═══██╗██║░░░██║██╔══██║██║░░░░░  ██╔══╝░░██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝░░
░░╚██╔╝░░██║██████╔╝╚██████╔╝██║░░██║███████╗  ██║░░░░░██║░░██║██║░░██║██║░╚═╝░██║███████╗
░░░╚═╝░░░╚═╝╚═════╝░░╚═════╝░╚═╝░░╚═╝╚══════╝  ╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝╚══════╝

Basic visual element. A frame that cannot contain actual elements, but is used as a building block by other elements (i.e. backgrounds)


VisualFrame (and possibly other such elements in the future) are 'helper' classes.
    They act as shared building blocks between elements (a "visual frame") that can be utilized by actual container frames, labels, buttons, etc.

    NOTE: VisualFrame is rendered separately from the standard render loop (based on children).
    Hence, it doesn't have a zIndex.

*/

class VisualFrame extends UIElement {



    // All of the styles for each possible state of the element
    FrameStyle frameDefault;
    FrameStyle frameHovered;
    FrameStyle frameActivated;
    FrameStyle frameDisabled;

    // Whatever style is currently applied. Will be changed whenever the field 'state' changes.
    FrameStyle currentStyle = frameDefault;


    // Constructor isn't public because VisualFrame is a Helper Class
                      // Hierarchy       // Style       // Positioning          // Size
    VisualFrame(Container parent, UITheme theme, FrameStyle[] stylePack, float xPos, float yPos, float xSize, float ySize) {
        super(parent, theme, 0, xPos, yPos, xSize, ySize);

        if (stylePack != null) updateStylePack(stylePack);
        else updateStylePack(); // If no style pack has been provided, then fall back to the defaults of the theme.
    }


    // Update the new styles after the theme of the element changes.
    void updateStylePack() {
        this.frameDefault = theme.frame(UIState.DEFAULT);
        this.frameHovered = theme.frame(UIState.HOVERED);
        this.frameActivated = theme.frame(UIState.ACTIVATED);
        this.frameDisabled = theme.frame(UIState.DISABLED);

        this.currentStyle = frameDefault;
    }

    // Apply a new style pack to the element.
    void updateStylePack(FrameStyle[] newStyles) {

        // We don't have to worry that much about missing styles.
        //  If a style is missing for a specific state, then it simply won't update from the previous, valid style.
        //  If no custom styles have been applied yet, then those are just the default ones.
        if (newStyles[0] != null) frameDefault = newStyles[0];
        if (newStyles[1] != null) frameHovered = newStyles[1];
        if (newStyles[2] != null) frameActivated = newStyles[2];
        if (newStyles[3] != null) frameDisabled = newStyles[3];
    }

    @Override public void setTheme(UITheme theme) {
        super.setTheme(theme);
        updateStylePack();
    }



    // As the VisualFrame is rendered directly from another component
    // This method DOES NOT OVERRIDE the UIElement void render() method.
    void render() {
        if (this.state != null) { // Update current style based on the currently applied state
            switch (this.state) {
            case HOVERED:
                currentStyle = frameHovered;
                break;
            case ACTIVATED:
                currentStyle = frameActivated;
                break;
            case DISABLED:
                currentStyle = frameDisabled;
                break;
            default:
                currentStyle = frameDefault;
                break;
            }
        }

        // If currentStyle is not loaded in yet, then don't even attempt to draw anything.
        if (currentStyle == null) return;

        // Combine backgroundColor with backgroundTransparency and then set that as the actual color.
        applet.fill(color(
            red(currentStyle.backgroundColor),
            green(currentStyle.backgroundColor),
            blue(currentStyle.backgroundColor),
            map(currentStyle.backgroundTransparency, 0, 1, 255, 0) // We're using map() here instead of a mathematical operation as we need the results to be inverted compared to how Processing usually expects alpha.
                                                                   // A value of 0 should mean full opacity while a value of 1 should mean full transparency (in our case)
        ));

        applet.strokeWeight(currentStyle.strokeWeight);

        // Same principle as above.
        applet.stroke(color(
            red(currentStyle.strokeColor),
            green(currentStyle.strokeColor),
            blue(currentStyle.strokeColor),
            map(currentStyle.strokeTransparency, 0, 1, 255, 0)
        ));

        // Render the actual frame (rectangle)
        applet.rect(xAbs, yAbs, xSize, ySize, currentStyle.cornerRadius);

        // println("Parent: " + parent + " Coordinates: x" + xAbs + "   y: " + yAbs);
    }



}