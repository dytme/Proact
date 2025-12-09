/*

██╗░░░██╗██╗███████╗██╗░░░░░███████╗███╗░░░███╗███████╗███╗░░██╗████████╗
██║░░░██║██║██╔════╝██║░░░░░██╔════╝████╗░████║██╔════╝████╗░██║╚══██╔══╝
██║░░░██║██║█████╗░░██║░░░░░█████╗░░██╔████╔██║█████╗░░██╔██╗██║░░░██║░░░
██║░░░██║██║██╔══╝░░██║░░░░░██╔══╝░░██║╚██╔╝██║██╔══╝░░██║╚████║░░░██║░░░
╚██████╔╝██║███████╗███████╗███████╗██║░╚═╝░██║███████╗██║░╚███║░░░██║░░░
░╚═════╝░╚═╝╚══════╝╚══════╝╚══════╝╚═╝░░░░░╚═╝╚══════╝╚═╝░░╚══╝░░░╚═╝░░░

Building blocks (shared architecture) of all UI elements

*/

abstract class UIElement implements Container {

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

    // 'protected' == Only subclasses (Frames, Buttons, etc.) can use it.
    protected UIElement(Container parent, UITheme theme, int zIndex, float xPos, float yPos, float xSize, float ySize) {

        // if (parent == null) parent = UIRoot; // TODO: Create a ScreenGUI-esque UI element, an instance of which will be created on set-up and act as the fallback/default when no parent is mentioned.
        this.parent = parent;

        this.theme = theme;
        this.zIndex = zIndex;

        this.xPos = xPos;
        this.yPos = yPos;
        this.xSize = xSize;
        this.ySize = ySize;

        setPosition(xPos, yPos);
        setZIndex(zIndex);
            

    }




    // █▀▀ █▀▀ ▀█▀ ▀█▀ █▀▀ █▀█ █▀
    // █▄█ ██▄ ░█░ ░█░ ██▄ █▀▄ ▄█
    
    @Override public float[] getPosition() {
        float[] parentPosition = { xAbs, yAbs };
        return parentPosition;
    }

    @Override public float[] getSize() {
        float[] parentPosition = { xSize, ySize };
        return parentPosition;
    }

    @Override public int getZIndex() { return zIndexAbs; }

    
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