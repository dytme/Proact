/*

███████╗██████╗░░█████╗░███╗░░░███╗███████╗░██████╗
██╔════╝██╔══██╗██╔══██╗████╗░████║██╔════╝██╔════╝
█████╗░░██████╔╝███████║██╔████╔██║█████╗░░╚█████╗░
██╔══╝░░██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝░░░╚═══██╗
██║░░░░░██║░░██║██║░░██║██║░╚═╝░██║███████╗██████╔╝
╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝╚══════╝╚═════╝░

Basic container(s) that can hold other elements

*/

public class Frame extends UIElement implements Container, Hoverable {

    private final ChildManager childManager = new ChildManager();
    @Override public void addChild(UIElement child) { childManager.addChild(child); }
    @Override public void removeChild(UIElement child) { childManager.removeChild(child); }

    // All subset elements
    ArrayList<UIElement> children;

    // All of the styles for each possible state of the element
    FrameStyle frameDefault = theme.frame(UIState.DEFAULT);
    FrameStyle frameHovered = theme.frame(UIState.DEFAULT);

    // Whatever style is currently applied. Will be changed whenever the field 'state' changes.
    FrameStyle currentStyle = frameDefault;

         // Hierarchy       // Style       // Render   // Positioning        // Size
    public Frame(Container parent, UITheme theme, int zIndex, float xPos, float yPos, float xSize, float ySize) {
        super(parent, theme, zIndex, xPos, yPos, xSize, ySize);
    }

    void render() {

        //TODO: Check if there are any children, and if so, render them as well!!

        // Check if there are any children present, and if so, render them!
        UIElement[] children = childManager.getChildren();
        for (UIElement child : children) {
            if (child.visible) child.render();
        }

        println("frame rendered");

        fill(currentStyle.backgroundColor);
        strokeWeight(currentStyle.strokeWeight);
        stroke(currentStyle.strokeColor);

        rect(xAbs, yAbs, xSize, ySize, currentStyle.cornerRadius);
    }

}