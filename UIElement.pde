// package proact.ui;
// TODO: All UI elements could be moved into a proact.ui package, which will contain all individual UI element classes.

/*

██╗░░░██╗██╗███████╗██╗░░░░░███████╗███╗░░░███╗███████╗███╗░░██╗████████╗
██║░░░██║██║██╔════╝██║░░░░░██╔════╝████╗░████║██╔════╝████╗░██║╚══██╔══╝
██║░░░██║██║█████╗░░██║░░░░░█████╗░░██╔████╔██║█████╗░░██╔██╗██║░░░██║░░░
██║░░░██║██║██╔══╝░░██║░░░░░██╔══╝░░██║╚██╔╝██║██╔══╝░░██║╚████║░░░██║░░░
╚██████╔╝██║███████╗███████╗███████╗██║░╚═╝░██║███████╗██║░╚███║░░░██║░░░
░╚═════╝░╚═╝╚══════╝╚══════╝╚══════╝╚═╝░░░░░╚═╝╚══════╝╚═╝░░╚══╝░░░╚═╝░░░

Building blocks (shared architecture) of all UI elements

*/

abstract class UIElement implements StateDriven {

    // Positioning Fields
    // TODO: Think about implementing Scaling / Offset (like in Roblox, lol)
    float xAbs, yAbs, xPos, yPos;
    float xSize, ySize;
    float xAnchor = 0, yAnchor = 0;

    // Rendering Fields
    UITheme theme;
    UIState state;

    UIRoot root;
    PApplet applet;

    Container parent;
    int zIndex;
    int zIndexAbs;
    
    boolean visible;
    
    // Event Fields
    Runnable onReturn; // Whenever the object returns to it's default state.
    Runnable onClick;
    Runnable onHover;
    // Runnable onDrag;


    
    // █▀▀ █▀█ █▄░█ █▀ ▀█▀ █▀█ █░█ █▀▀ ▀█▀ █▀█ █▀█ █▀
    // █▄▄ █▄█ █░▀█ ▄█ ░█░ █▀▄ █▄█ █▄▄ ░█░ █▄█ █▀▄ ▄█

    // 'protected' == Only subclasses (Frames, Buttons, etc.) can use it.
    // Constructor used by actual UI Elements
    protected UIElement(Container parent, UITheme theme, int zIndex, float xPos, float yPos, float xSize, float ySize) {

        if (parent == null) {
            this.parent = proactRoot;
        } else this.parent = parent;

        root = this.parent.getRoot(); // Get and store the root of an element. We need this to properly call on the PApplet instance handling a set of UIs, without
                                      // burdening the user with manually assigning a proper PApplet.
        this.applet = root.getApplet();                              

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
    // PApplet is handled directly in the UIRoot constructor.
    protected UIElement(int zIndex, boolean visible) {
        this.zIndex = zIndex;
        this.visible = visible;
    }



    // █▀█ █▀▀ █▀▀ █▀▀ █▀█ █▀▀ █▄░█ █▀▀ █▀▀   █▀▄▀█ █▀▀ ▀█▀ █░█ █▀█ █▀▄ █▀
    // █▀▄ ██▄ █▀░ ██▄ █▀▄ ██▄ █░▀█ █▄▄ ██▄   █░▀░█ ██▄ ░█░ █▀█ █▄█ █▄▀ ▄█
    // Will be overriden by individual elements, but have to be referenced.

    void render() {};



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

    public UIState getUIState() { return state; }

    UIRoot getRoot() {
        // If the parent of an element is null, then that element is a root.
        // Otherwise, keep repeating the parent check until we reach the point where we have a null parent.
        if (this.parent == null ) {
            return (UIRoot) this; 
            // Casting like this is generally considered unsafe, BUT for our intents and purposes, we're overcoming a limitation of type-safe languages here,
                                     //     because the only situation where the parent of an object can be null is if that element is actually a UIRoot.
                                     // UIRoots are always Containers, but because this method is implemented within UIElement, to run from any element, then `this` will be a general
                                     //     reference from the perspective of Java, obligatory for a UIElement type. Despite this method existing within every single UIElement, this
                                     //     specific statement should only be ran when the if condition is met-- and that only happens if the element itself happens to be a Container
                                     //     anyway-- hence, it should be safe.
                                     // However, this is still risky business. It might throw a weird error sometimes :(
        } else return this.parent.getRoot();
    }

    
    // █▀ █▀▀ ▀█▀ ▀█▀ █▀▀ █▀█ █▀
    // ▄█ ██▄ ░█░ ░█░ ██▄ █▀▄ ▄█

    public void setVisible(boolean arg) {
        // TODO: Figure out a way to update the presence of individual elemenents in ArrayLists that are continuously looped to check interaction
        // i.e. when a button is invisible, stop the framework from checking whether or not the mouse is on top of it to update it's state to HOVERED.
        visible = arg;
    }

    public void setZIndex(int ind) {
        zIndexAbs = parent.getZIndex() + ind;
    }

    public void setAbsolute(float x, float y) {
        xAbs = x;
        yAbs = y;
    }

    public void setPosition(float x, float y) {
        float parentPosition[] = parent.getPosition();
        this.xAbs = parentPosition[0] + x - (xSize * xAnchor);
        this.yAbs = parentPosition[1] + y - (ySize * yAnchor);
    }

    public void setAnchorPoints(float x, float y) {
        xAnchor = x;
        yAnchor = y;
        setPosition(xPos, yPos);
    }

    @Override public void setUIState(UIState state) {
        this.state = state;
    }

    public void setEventMethod(UIState state, Runnable method) {
        switch (state) {
            case HOVERED:
                onHover = method;
                break;
            case ACTIVATED:
                onClick = method;
                break;
            default:
                onReturn = method;
                break;
        }
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
        children.sort((a, b) -> Integer.compare(a.getZIndex(), b.getZIndex()));
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