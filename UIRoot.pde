/*

██╗░░░██╗██╗██████╗░░█████╗░░█████╗░████████╗
██║░░░██║██║██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝
██║░░░██║██║██████╔╝██║░░██║██║░░██║░░░██║░░░
██║░░░██║██║██╔══██╗██║░░██║██║░░██║░░░██║░░░
╚██████╔╝██║██║░░██║╚█████╔╝╚█████╔╝░░░██║░░░
░╚═════╝░╚═╝╚═╝░░╚═╝░╚════╝░░╚════╝░░░░╚═╝░░░

Akin to Roblox ScreenGUIs -- super containers for all UI elements.

*/

public class UIRoot extends UIElement implements Container  {

    // Implement Child Manager and expose specific functions to the public.
    private final ChildManager childManager = new ChildManager();
    @Override public void addChild(UIElement child) { childManager.addChild(child); }
    @Override public void removeChild(UIElement child) { childManager.removeChild(child); }

    public UIRoot(int zIndex, boolean visible) {
        super(zIndex, visible);

        println(visible);

        this.xPos = 0;
        this.yPos = 0;

        this.xSize = width;
        this.ySize = height;

        UIRoots.add(this);
    }

    void render() {

        println("rendering all visible children of root");

        UIElement[] children = childManager.getChildren();
        // TODO: Sort this list by zIndex before proceeding.
        for (UIElement child : children) {
            if (child.visible) child.render();
        }

    }

}