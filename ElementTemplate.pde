/*

███████╗██████╗░░█████╗░███╗░░░███╗███████╗░██████╗
██╔════╝██╔══██╗██╔══██╗████╗░████║██╔════╝██╔════╝
█████╗░░██████╔╝███████║██╔████╔██║█████╗░░╚█████╗░
██╔══╝░░██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝░░░╚═══██╗
██║░░░░░██║░░██║██║░░██║██║░╚═╝░██║███████╗██████╔╝
╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝╚══════╝╚═════╝░

Basic container(s) that can hold other elements

*/

/*

public class Template extends UIElement implements Container, Hoverable, Clickable {

    // Handle hierarchy with other UI elements as a container
    private final ChildManager childManager = new ChildManager();
    @Override public void addChild(UIElement child) { childManager.addChild(child); }
    @Override public void removeChild(UIElement child) { childManager.removeChild(child); }

    // All subset elements
    ArrayList<UIElement> children;

    // All of the styles for each possible state of the element
    FrameStyle frameDefault = theme.frame(UIState.DEFAULT);
    FrameStyle frameHovered = theme.frame(UIState.HOVERED);
    FrameStyle frameActivated = theme.frame(UIState.ACTIVATED);

    // Whatever style is currently applied. Will be changed whenever the field 'state' changes.
    FrameStyle currentStyle = frameDefault;

         // Hierarchy       // Style       // Render   // Positioning        // Size
    public Frame(Container parent, UITheme theme, int zIndex, float xPos, float yPos, float xSize, float ySize) {
        super(parent, theme, zIndex, xPos, yPos, xSize, ySize);

        // Add this element to all ArrayLists of events that it implements.
        Events.hoverableElements.add(this);
        Events.sortHoverableElementsByZIndex();

        // TEMPORARY Clickable
        Events.clickableElements.add(this);
        Events.sortClickableElementsByZIndex();
    }

    void applyTheme(UITheme theme) {
        this.theme = theme;
        
        frameDefault = theme.frame(UIState.DEFAULT);
        frameHovered = theme.frame(UIState.HOVERED);
        frameActivated = theme.frame(UIState.ACTIVATED);
    }

    void render() {

        // Update current style based on the currently applied state
        if (state != null) {
            switch (state) {
            case HOVERED:
                currentStyle = frameHovered;
                break;
            case ACTIVATED:
                currentStyle = frameActivated;
                break;
            default:
                currentStyle = frameDefault;
                break;
            }
        }

        // FIRST AND FOREMOST Render itself (the container)

        // Combine backgroundColor with backgroundTransparency and then set that as the actual color.
        applet.fill(color(
            red(currentStyle.backgroundColor),
            blue(currentStyle.backgroundColor),
            green(currentStyle.backgroundColor),
            map(currentStyle.backgroundTransparency, 0, 1, 255, 0) // We're using map() here instead of a mathematical operation as we need the results to be inverted compared to how Processing usually expects alpha.
                                                                   // A value of 0 should mean full opacity while a value of 1 should mean full transparency (in our case)
        ));

        print(currentStyle.backgroundTransparency);

        applet.strokeWeight(currentStyle.strokeWeight);

        // Same principle as above.
        applet.stroke(color(
            red(currentStyle.strokeColor),
            blue(currentStyle.strokeColor),
            green(currentStyle.strokeColor),
            map(currentStyle.strokeTransparency, 0, 1, 255, 0)
        ));


        applet.rect(xAbs, yAbs, xSize, ySize, currentStyle.cornerRadius);

        // THEN Check if there are any children present, and if so, render them!
        UIElement[] children = childManager.getChildren();
        for (UIElement child : children) {
            if (child.visible) child.render();
        }

    }

}

*/