// package proact.ui

/*

██████╗░██╗░░░██╗████████╗████████╗░█████╗░███╗░░██╗
██╔══██╗██║░░░██║╚══██╔══╝╚══██╔══╝██╔══██╗████╗░██║
██████╦╝██║░░░██║░░░██║░░░░░░██║░░░██║░░██║██╔██╗██║
██╔══██╗██║░░░██║░░░██║░░░░░░██║░░░██║░░██║██║╚████║
██████╦╝╚██████╔╝░░░██║░░░░░░██║░░░╚█████╔╝██║░╚███║
╚═════╝░░╚═════╝░░░░╚═╝░░░░░░╚═╝░░░░╚════╝░╚═╝░░╚══╝

Interactable element that can run methods when hovered on pressed, while also supporting TextLabels or Icons.

*/

// TODO: Replace the current "Helper" button with this method. Rename it to something more abstract like "Button"
public class Button extends UIElement implements Container, Hoverable, Clickable {

    // Logic Fields
    boolean toggleable;
    boolean pressed;

    // Array for all Visual Elements
    ArrayList<UIElement> subsetElements = new ArrayList<>();

    // Individual Visual Elements
    VisualFrame visualFrame;
    TextLabel textLabel;
    ShapeLabel icon;

    // Handle hierarchy with other UI elements as a container
    private final ChildManager childManager = new ChildManager();
    @Override public void addChild(UIElement child) { childManager.addChild(child); }
    @Override public void removeChild(UIElement child) { childManager.removeChild(child); }

    // Specific Button Logic
    Runnable onHover;
    Runnable onClick;



    // █▀▀ █▀█ █▄░█ █▀ ▀█▀ █▀█ █░█ █▀▀ ▀█▀ █▀█ █▀█
    // █▄▄ █▄█ █░▀█ ▄█ ░█░ █▀▄ █▄█ █▄▄ ░█░ █▄█ █▀▄


    public Button(Container parent, UITheme theme, FrameStyle[] stylePack, boolean toggleable) {
        super(parent, theme, 0, 0, 0, 100, 50);

        this.toggleable = toggleable;

        // Create a Visual Frame element that will act as the 'visible' part of the button
        visualFrame = new VisualFrame(
            parent, theme, 
            stylePack,
            0.0, 0.0, xSize, ySize
        );
        subsetElements.add(visualFrame); // Link the VisualFrame of the button with the rest of the subset visual elements.

        // Create a TextLabel that will handle the actual text
        // Container parent, UITheme theme, boolean hasVisualFrame, int zIndex, float xPos, float yPos, float xSize, float ySize

        // TODO: Make the creation of a TextLabel an optional thing that happens if and only if a label is 'applied' to the button
        // textLabel = new TextLabel(this, null, false, 1, 0, 0, xSize, ySize);

        // Explicitly mention that this is to be considered a 'child' of it's parent, and not a building block of the parent itself.
        this.parent.addChild(this);

        Events.hoverableElements.add(this);
        Events.clickableElements.add(this);
    }

    void constructTextLabel() { 
        textLabel = new TextLabel(this, this.theme, null, false);
        textLabel.setSize(xSize, ySize);
        subsetElements.add(textLabel); 
    }

    void constructIcon(String dest) { 
        icon = new ShapeLabel(this, this.theme, dest, true);
        computeIconSize();
        subsetElements.add(icon);
    }

    void constructIcon(PShape shape) { 
        icon = new ShapeLabel(this, this.theme, shape, true); 
        computeIconSize();
        subsetElements.add(icon);
    }



    // █▀ █▀▀ ▀█▀ ▀█▀ █▀▀ █▀█ █▀
    // ▄█ ██▄ ░█░ ░█░ ██▄ █▀▄ ▄█

    public void setSwitchState(boolean forced) {
        this.pressed = forced;
    }

    @Override public void setTheme(UITheme theme) {
        super.setTheme(theme);
        visualFrame.setTheme(theme);
    }

    public void updateStylePack(FrameStyle[] stylePack) {
        visualFrame.updateStylePack(stylePack);
    }

    // Set new Runnables to be triggered onClick or onHover
    @Override void setOnClick(Runnable method) { this.onClick = method; }
    @Override void setOnHover(Runnable method) { this.onHover = method; }

    // TEXTLABEL SETTER FORWARDERS
    // All of these must first check if TextLabel has been constructed yet, and if not, then construct it themselves.
    public void setContent(String s) { 
        if (textLabel == null ) constructTextLabel();
        textLabel.setContent(s);
        
    }

    public void setTextSize(float s) { 
        if (textLabel == null ) constructTextLabel();
        textLabel.setTextSize(s);
    }

    public void updateLabelStylePack(TextLabelStyle[] newStyles) {
        textLabel.updateStylePack(newStyles);
    }

    // ICON SETTER FORWARDERS
    public void setIcon(String dest) {
        if (icon == null) {
            constructIcon(dest);
        } else icon.setShape(dest);
    }

    public void setIcon(PShape shape) {
        if (icon == null) {
            constructIcon(shape);
        } else icon.setShape(shape);
    }

    public void computeIconSize() {
        float xs = xSize*0.68;
        float ys = ySize*0.68;

        if (xs < ys) icon.setSize(xs, xs);
        else icon.setSize(ys, ys);
    }


    
    // █▀▀ █▀▀ ▀█▀ ▀█▀ █▀▀ █▀█ █▀
    // █▄█ ██▄ ░█░ ░█░ ██▄ █▀▄ ▄█

    public boolean getSwitchState() { return pressed; }

    

    // ▄▀█ █▀▀ ▀█▀ █ █▀█ █▄░█ █▀
    // █▀█ █▄▄ ░█░ █ █▄█ █░▀█ ▄█

    void mouseClicked() {
        this.state = UIState.ACTIVATED;

        if (toggleable) pressed = !pressed;
        else pressed = true;
        
        if (onClick != null) onClick.run();
    }

    void mouseHovered() {
        if (onHover != null) onHover.run();
    }



    // █▀█ █▀▀ █▄░█ █▀▄ █▀▀ █▀█
    // █▀▄ ██▄ █░▀█ █▄▀ ██▄ █▀▄

    @Override void render() {

        // Logic for the button's pressed state.
        // if (this.state != null) {
        //     switch (this.state) {
        //         case ACTIVATED: // When the button is clicked, set pressed to true
        //             pressed = true;
        //             break;
        //         default:
        //             pressed = false;
        //             break;
        //     }
        // }

        
        UIState visualState = this.state;
        if (visualState != UIState.ACTIVATED) { // If the button is no longer being actively clicked on
            if (!toggleable) pressed = false; // If the button is not toggleable, just reset pressed back to false.
            else if (pressed) visualState = UIState.ACTIVATED; // If the button is toggleable, then force the visualState to be ACTIVATED until pressed is set to false by the onClick method.
        }

        // Communicate the current state of the Button to all of its subset visual elements
        for (UIElement element : subsetElements) {
            element.setSize(this.xSize, this.ySize);
            element.setAnchorPoints(this.xAnchor, this.yAnchor);
            element.setAbsolute(this.xAbs, this.yAbs);
            element.setUIState(visualState);
        }

        // Center the button's icon to the middle of it.
        if (icon != null) {
            icon.setAnchorPoints(0.5, 0.5);
            computeIconSize();
            icon.setPosition(xSize/2,ySize/2);
        }

        // println(this.pressed);


        // Render all of the linked visual elements, after their custom settings were applied
        for (UIElement element : subsetElements) element.render();

    }

}
