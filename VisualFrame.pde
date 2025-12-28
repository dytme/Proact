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

    NOTE: VisualFrame DOES NOT utilize it's own state field given from UIElement.
    The alternative of either moving all state logic from UIElement to individual elements OR implementing separate positioning mechanics to VisualFrame was not worth it.

    NOTE: VisualFrame is rendered separately from the standard render loop (based on children).
    Hence, it doesn't have a zIndex either.

*/

class VisualFrame extends UIElement {



    // All of the styles for each possible state of the element
    FrameStyle frameDefault = theme.frame(UIState.DEFAULT);
    FrameStyle frameHovered = theme.frame(UIState.HOVERED);
    FrameStyle frameActivated = theme.frame(UIState.ACTIVATED);
    FrameStyle frameDisabled = theme.frame(UIState.DISABLED);

    // Whatever style is currently applied. Will be changed whenever the field 'state' changes.
    FrameStyle currentStyle = frameDefault;



                      // Hierarchy       // Style       // Positioning          // Size
    public VisualFrame(Container parent, UITheme theme, float xPos, float yPos, float xSize, float ySize) {
        super(parent, theme, 0, xPos, yPos, xSize, ySize);
    }



    @Override void setTheme(UITheme theme) {
        super.setTheme(theme);

        frameDefault = theme.frame(UIState.DEFAULT);
        frameHovered = theme.frame(UIState.HOVERED);
        frameActivated = theme.frame(UIState.ACTIVATED);
    }



    // As the VisualFrame is rendered directly from another component
    // This method DOES NOT OVERRIDE the UIElement void render() method.
    void render(UIState renderState) {
        // println(renderState);
        if (renderState != null) { // Update current style based on the currently applied state
            println(renderState);
            switch (renderState) {
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
    }



}