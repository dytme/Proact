/*

██╗███╗░░██╗████████╗███████╗██████╗░███████╗░█████╗░░█████╗░███████╗░██████╗
██║████╗░██║╚══██╔══╝██╔════╝██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝██╔════╝
██║██╔██╗██║░░░██║░░░█████╗░░██████╔╝█████╗░░███████║██║░░╚═╝█████╗░░╚█████╗░
██║██║╚████║░░░██║░░░██╔══╝░░██╔══██╗██╔══╝░░██╔══██║██║░░██╗██╔══╝░░░╚═══██╗
██║██║░╚███║░░░██║░░░███████╗██║░░██║██║░░░░░██║░░██║╚█████╔╝███████╗██████╔╝
╚═╝╚═╝░░╚══╝░░░╚═╝░░░╚══════╝╚═╝░░╚═╝╚═╝░░░░░╚═╝░░╚═╝░╚════╝░╚══════╝╚═════╝░

*/




// █▀▀ █░█ █▀▀ █▄░█ ▀█▀ █▀
// ██▄ ▀▄▀ ██▄ █░▀█ ░█░ ▄█

// Added a static class here to make the conversion to a library easier on the longer-term.
//      static -- means that it's more akin to the classes in Themes, as in it acts as data storage rather than a template for objects to piggyback off of.
//      public -- (in the future) can be accessed by other packages (mostly Proact.UI)
public static class Events {

    // This has a bit of boilerplate, but the alternative for Java to having a generic method that could sort these individually is more complex than simply having a few of these methods in parallel.
    public static final ArrayList<Clickable> clickableElements = new ArrayList<>();
    public static final ArrayList<Hoverable> hoverableElements = new ArrayList<>();


    public static void sortClickableElementsByZIndex() {
        // Sorting everything from largest zIndexAbs to smallest zIndexAbs (so that we only register the hover interaction on the highest-showing element and not all of them.)
        clickableElements.sort((a, b) -> Integer.compare(b.getZIndex(), a.getZIndex()));
    }

    public static void sortHoverableElementsByZIndex() {
        // Sorting everything from largest zIndexAbs to smallest zIndexAbs (so that we only register the hover interaction on the highest-showing element and not all of them.)
        hoverableElements.sort((a, b) -> Integer.compare(b.getZIndex(), a.getZIndex()));
    }

}

// Depends on Hoverable, as in order to check if pressing the mouse implies something gets pressed, you need to know if the mouse is hovering on top of something.
// TODO: Move these in their own individual files.
public interface Clickable extends StateDriven, Container, Hoverable {
    default boolean isClicked(float cx, float cy) {
        return isMouseOver(cx, cy);
    }
}

public interface Hoverable extends StateDriven, Container {

    default boolean isMouseOver(float cx, float cy) {
        float[] absPos = this.getPosition();
        float[] size = this.getSize();

        // println(absPos[0] + ", " + cx + ", " + (absPos[0]+size[0]) + " // " + absPos[1] + ", " + cy + ", " + (absPos[1]+size[1]));

        if ((cx > absPos[0] && cx < absPos[0] + size[0]) && (cy > absPos[1] && cy < absPos[1] + size[1])) {
            return true;
        } else return false;
    }

}




// █▀█ █▀█ █▀█ █▀█ █▀▀ █▀█ ▀█▀ █ █▀▀ █▀
// █▀▀ █▀▄ █▄█ █▀▀ ██▄ █▀▄ ░█░ █ ██▄ ▄█


// Can contain other UI elements
public interface Container {
    float[] getPosition();
    float[] getSize();
    int getZIndex();

    // Expose specific child management methods to potential children
    void addChild(UIElement child);
    void removeChild(UIElement child);
    UIRoot getRoot();
}


// Is state-driven
public interface StateDriven {
    UIState getUIState();
    void setUIState(UIState state);
}