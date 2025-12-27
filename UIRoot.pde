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

    final PApplet applet; // Right now I see no reason as to why this shouldn't be reassignable, but because I don't 100% understand how PApplet works under the hood,
                                 // I fear that not limiting reassignments might lead to very weird issues which I won't be able to debug.

    public UIRoot(PApplet applet, int zIndex, boolean visible) {
        super(zIndex, visible);
        this.applet = applet; // Store the 

        this.xPos = 0;
        this.yPos = 0;

        this.xSize = width;
        this.ySize = height;

        UIRoots.add(this);

        println(this.parent);
    }

    public PApplet getApplet() {
        return applet;
    }

    void render() {

        // println("rendering all visible children of root");

        UIElement[] children = childManager.getChildren();
        // TODO: Sort this list by zIndex before proceeding.
        for (UIElement child : children) {
            if (child.visible) child.render();
        }

    }

}