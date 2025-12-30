// package proact.ui

/*

░█████╗░░█████╗░███╗░░██╗████████╗░█████╗░██╗███╗░░██╗███████╗██████╗░  ███████╗██████╗░░█████╗░███╗░░░███╗███████╗
██╔══██╗██╔══██╗████╗░██║╚══██╔══╝██╔══██╗██║████╗░██║██╔════╝██╔══██╗  ██╔════╝██╔══██╗██╔══██╗████╗░████║██╔════╝
██║░░╚═╝██║░░██║██╔██╗██║░░░██║░░░███████║██║██╔██╗██║█████╗░░██████╔╝  █████╗░░██████╔╝███████║██╔████╔██║█████╗░░
██║░░██╗██║░░██║██║╚████║░░░██║░░░██╔══██║██║██║╚████║██╔══╝░░██╔══██╗  ██╔══╝░░██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝░░
╚█████╔╝╚█████╔╝██║░╚███║░░░██║░░░██║░░██║██║██║░╚███║███████╗██║░░██║  ██║░░░░░██║░░██║██║░░██║██║░╚═╝░██║███████╗
░╚════╝░░╚════╝░╚═╝░░╚══╝░░░╚═╝░░░╚═╝░░╚═╝╚═╝╚═╝░░╚══╝╚══════╝╚═╝░░╚═╝  ╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝╚══════╝

Basic container(s) that can hold other elements

*/

public class ContainerFrame extends UIElement implements Container {

    // Handle hierarchy with other UI elements as a container
    private final ChildManager childManager = new ChildManager();
    @Override public void addChild(UIElement child) { childManager.addChild(child); }
    @Override public void removeChild(UIElement child) { childManager.removeChild(child); }

    // Visual Frame element
    VisualFrame visualFrame;

         // Hierarchy       // Style       // Render   // Positioning        // Size
    public ContainerFrame(Container parent, UITheme theme) {
        super(parent, theme, 0, 0, 0, 100, 100);

        // Create a Visual Frame element that will act as the 'visible' part of the frame.
        //      xPos and yPos = 0 because positioning is relative. We want our visualFrame to cover the entire area of our actual element.
        //      As such, we need it's position to be 0,0 and it's size to be equal to that of the actual element.
        visualFrame = new VisualFrame(this, this.theme, 0, 0, xSize, ySize);

        // Explicitly mention that this is to be considered a 'child' of it's parent, and not a building block of the parent itself.
        this.parent.addChild(this);
    }


    // Setters
    @Override public void setTheme(UITheme theme) {
        super.setTheme(theme);
        visualFrame.setTheme(theme);
    }


    // Rendering
    @Override void render() {

        // Communicate the current state of the ContainerFrame to the VisualFrame and render it accordingly.
        visualFrame.setAnchorPoints(xAnchor, yAnchor);
        visualFrame.setAbsolute(xAbs, yAbs);
        visualFrame.setSize(xSize, ySize);

        visualFrame.setUIState(this.state);
        visualFrame.render();

        // THEN Check if there are any children present, and if so, render them!
        UIElement[] children = childManager.getChildren();
        for (UIElement child : children) {
            if (child.visible) child.render();
        }

    }

}