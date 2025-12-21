/*

██╗░░░██╗██╗███████╗██╗░░░░░███████╗███╗░░░███╗███████╗███╗░░██╗████████╗
██║░░░██║██║██╔════╝██║░░░░░██╔════╝████╗░████║██╔════╝████╗░██║╚══██╔══╝
██║░░░██║██║█████╗░░██║░░░░░█████╗░░██╔████╔██║█████╗░░██╔██╗██║░░░██║░░░
██║░░░██║██║██╔══╝░░██║░░░░░██╔══╝░░██║╚██╔╝██║██╔══╝░░██║╚████║░░░██║░░░
╚██████╔╝██║███████╗███████╗███████╗██║░╚═╝░██║███████╗██║░╚███║░░░██║░░░
░╚═════╝░╚═╝╚══════╝╚══════╝╚══════╝╚═╝░░░░░╚═╝╚══════╝╚═╝░░╚══╝░░░╚═╝░░░

Building blocks (shared architecture) of all UI elements

*/

abstract class UIElement {

    // Positioning Fields
    // TODO: Think about implementing Scaling / Offset (like in Roblox, lol)
    float xAbs, yAbs, xPos, yPos;
    float xSize, ySize;
    float xAnchor, yAnchor;

    // Rendering Fields
    UITheme theme;
    UIState state;

    Container parent;
    int zIndex;
    int zIndexAbs;
    
    boolean visible;
    
    // Event Fields TODO: Move to individual elements.
    // Runnable onClick;
    // Runnable onHover;
    // Runnable onDrag;


    
    // █▀▀ █▀█ █▄░█ █▀ ▀█▀ █▀█ █░█ █▀▀ ▀█▀ █▀█ █▀█ █▀
    // █▄▄ █▄█ █░▀█ ▄█ ░█░ █▀▄ █▄█ █▄▄ ░█░ █▄█ █▀▄ ▄█

    // 'protected' == Only subclasses (Frames, Buttons, etc.) can use it.
    // Constructor used by actual UI Elements
    protected UIElement(Container parent, UITheme theme, int zIndex, float xPos, float yPos, float xSize, float ySize) {

        if (parent == null) {
            this.parent = proactRoot;
        } else this.parent = parent;

        if (theme == null) {
            this.theme = DefaultTheme;
        } else this.theme = theme;

        this.zIndex = zIndex;

        this.xPos = xPos;
        this.yPos = yPos;
        this.xSize = xSize;
        this.ySize = ySize;

        setPosition(xPos, yPos);
        setZIndex(zIndex);

        this.parent.addChild(this);
            
    }

    // Constructor used for Roots
    // Only needs a zIndex (to handle render order) and a visible (active) state.
    protected UIElement(int zIndex, boolean visible) {
        this.zIndex = zIndex;
        this.visible = visible;
    }



    // █▀█ █▀▀ █▀▀ █▀▀ █▀█ █▀▀ █▄░█ █▀▀ █▀▀   █▀▄▀█ █▀▀ ▀█▀ █░█ █▀█ █▀▄ █▀
    // █▀▄ ██▄ █▀░ ██▄ █▀▄ ██▄ █░▀█ █▄▄ ██▄   █░▀░█ ██▄ ░█░ █▀█ █▄█ █▄▀ ▄█
    // Will be overriden by individual elements, but have to be referenced.

    void render(){};



    // █▀▀ █▀▀ ▀█▀ ▀█▀ █▀▀ █▀█ █▀
    // █▄█ ██▄ ░█░ ░█░ ██▄ █▀▄ ▄█
    
    public float[] getPosition() {
        float[] parentPosition = { xAbs, yAbs };
        return parentPosition;
    }

    public float[] getSize() {
        float[] parentPosition = { xSize, ySize };
        return parentPosition;
    }

    public int getZIndex() { return zIndexAbs; }

    
    // █▀ █▀▀ ▀█▀ ▀█▀ █▀▀ █▀█ █▀
    // ▄█ ██▄ ░█░ ░█░ ██▄ █▀▄ ▄█

    public void setVisible(boolean arg) {
        // TODO: Figure out a way to update the presence of individual elemenents in ArrayLists that are continuously looped to check interaction
        // i.e. when a button is invisible, stop the framework from checking whether or not the mouse is on top of it to update it's state to HOVERED.
        visible = arg;
    }

    public void setZIndex(int index) {
        zIndexAbs = parent.getZIndex() + index;
    }

    public void setAbsolute(float x, float y) {
        xAbs = x;
        yAbs = y;
    }

    public void setPosition(float x, float y) {
        float parentPosition[] = parent.getPosition();
        this.xAbs = parentPosition[0] + x;
        this.yAbs = parentPosition[1] + y;
    }

}


// Class<Type> means that the class can be assigned of a specific type later on, most likely UIElement in our case.
// class ChildManager<Type>

// Helper Class for UIElement that is used by container(s) to handle hierarchy (children) relationships with other elements.
class ChildManager {

    // All subset elements
    ArrayList<UIElement> children = new ArrayList<>();
    
    void addChild(UIElement child) {
        if (!children.contains(child)) children.add(child);
    }

    void removeChild(UIElement child) {
        children.remove(child);
    }

    UIElement[] getChildren() {
        return children.toArray(new UIElement[0]);
        // toArray(new UIElement[0]) uses the array only as a *type token*.
        // If the array is too small (0 almost always is), Java allocates a
        // new UIElement[] of the correct size, copies the elements, and
        // returns that new array. The 0 does NOT force the result to be empty.
    }

}