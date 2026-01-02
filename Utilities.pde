// package proact.utilities

/*

██╗░░░██╗████████╗██╗██╗░░░░░██╗████████╗██╗███████╗░██████╗
██║░░░██║╚══██╔══╝██║██║░░░░░██║╚══██╔══╝██║██╔════╝██╔════╝
██║░░░██║░░░██║░░░██║██║░░░░░██║░░░██║░░░██║█████╗░░╚█████╗░
██║░░░██║░░░██║░░░██║██║░░░░░██║░░░██║░░░██║██╔══╝░░░╚═══██╗
╚██████╔╝░░░██║░░░██║███████╗██║░░░██║░░░██║███████╗██████╔╝
░╚═════╝░░░░╚═╝░░░╚═╝╚══════╝╚═╝░░░╚═╝░░░╚═╝╚══════╝╚═════╝░

*/




// █▀▀ █▄░█ █░█ █▀▄▀█ █▀
// ██▄ █░▀█ █▄█ █░▀░█ ▄█

// What states can a UI element have?

enum UIState {
    DEFAULT,     // Basically Default, but I wanted to avoid confusion with the DefaultTheme
    HOVERED,    // When a cursor or mouse is on top of the element
    ACTIVATED,     // When the element is pressed/dragged/actively messed around with
    DISABLED,   // When interactions are disabled with the element
}

// What style of font could a label or button use?

enum FontStyle {
    REGULAR,
    BOLD,
    ITALIC
}




// █░█ █   ▀█▀ █░█ █▀▀ █▀▄▀█ █▀▀ █▀
// █▄█ █   ░█░ █▀█ ██▄ █░▀░█ ██▄ ▄█


// Shared Interface
// Allows individual elements to request information about any theme

interface UITheme {
    // Frames & Visual Frames
    FrameStyle frame(UIState state);

    FrameStyle[] buttonStylePack(String stylePackName);

    // Text
    TextLabelStyle textLabel(UIState state);
    PFont regularFont();
    PFont boldFont();
    PFont italicFont();
    
    TextLabelStyle[] textLabelStylePack(String stylePackName);

    // ShapeLabel
    ShapeLabelStyle shapeLabel(UIState state);
}




// █▀▀ █░█ █▀▀ █▄░█ ▀█▀ █▀
// ██▄ ▀▄▀ ██▄ █░▀█ ░█░ ▄█

// Added a static class here to make the conversion to a library easier on the longer-term.
//      static -- means that it's more akin to the classes in Themes, as in it acts as data storage rather than a template for objects to piggyback off of.
//      public -- (in the future) can be accessed by other packages (mostly Proact.UI)
public static class Events {

    // Global states for focused and hovered elements. These get updated with the latest UIElement which has been clicked or hovered.
    public static UIElement focusedElement;
    public static UIElement hoveredElement;
    public static Draggable draggedElement;


    // This has a bit of boilerplate, but the alternative for Java to having a generic method that could sort these individually is more complex than simply having a few of these methods in parallel.
    public static final ArrayList<Clickable> clickableElements = new ArrayList<>();
    public static final ArrayList<Hoverable> hoverableElements = new ArrayList<>();

    // TODO: REPLACE ALL DIRECT ADDITIONS WITH THESE SETTERS!!
    public static void registerToHoverable(Hoverable element) {
        hoverableElements.add(element);
        sortHoverableElementsByZIndex();
    }
    
    public static void registerToClickable(Clickable element) {
        clickableElements.add(element);
        sortClickableElementsByZIndex();
    }


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
public interface Clickable extends StateDriven, Hoverable {
    default boolean isClicked(float cx, float cy) {
        return isMouseOver(cx, cy);
    }

    public void setOnClick(Runnable method);
    public void mouseClicked();
}

public interface Hoverable extends StateDriven {

    // All Hoverable objects will inherit these methods from UIElement. All we're doing is referencing them.
    float[] getPosition();
    float[] getSize();
    int getZIndex();

    // Checks if the mouse is hovering on top of an UIElement
    default boolean isMouseOver(float cx, float cy) {
        float[] absPos = this.getPosition();
        float[] size = this.getSize();

        // println(absPos[0] + ", " + cx + ", " + (absPos[0]+size[0]) + " // " + absPos[1] + ", " + cy + ", " + (absPos[1]+size[1]));

        if ((cx > absPos[0] && cx < absPos[0] + size[0]) && (cy > absPos[1] && cy < absPos[1] + size[1])) {
            return true;
        } else return false;
    }

    // Transfer the Runnable method to the button, to be triggered whenever the button is hovered.
    public void setOnHover(Runnable method);
    public void mouseHovered();

}

public interface Draggable {
    public void onDrag(float cx, float cy);
}

public interface AcceptKeyboardInput {
    public void keyboardInput(char key);
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




