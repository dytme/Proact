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


public class Button extends UIElement implements Container, Hoverable, Clickable {

    // Logic Fields
    boolean toggleable;
    boolean pressed;

    // Specific Button Logic
    Runnable onHover;
    Runnable onClick;

    // Individual Visual Elements
    VisualFrame visualFrame;
    TextLabel textLabel;
    ShapeLabel icon;

    // Handle hierarchy with other UI elements as a container
    private final ChildManager childManager = new ChildManager();
    @Override public void addChild(UIElement child) { childManager.addChild(child); }
    @Override public void removeChild(UIElement child) { childManager.removeChild(child); }






    // █▀▀ █▀█ █▄░█ █▀ ▀█▀ █▀█ █░█ █▀▀ ▀█▀ █▀█ █▀█
    // █▄▄ █▄█ █░▀█ ▄█ ░█░ █▀▄ █▄█ █▄▄ ░█░ █▄█ █▀▄


    public Button(Container parent, UITheme theme, FrameStyle[] stylePack, boolean toggleable) {
        super(parent, theme, 0, 0, 0, 100, 50);

        this.toggleable = toggleable;

        // Create a Visual Frame element that will act as the 'visible' part of the button
        visualFrame = new VisualFrame(
            this, theme, 
            stylePack,
            0.0, 0.0, xSize, ySize
        );

        // Explicitly add VisualFrame as a child of this button
        this.addChild(visualFrame);

        // Explicitly mention that this is to be considered a 'child' of it's parent, and not a building block of the parent itself.
        this.parent.addChild(this);

        Events.registerToHoverable(this);
        Events.registerToClickable(this);
    }

    void constructTextLabel() { 
        textLabel = new TextLabel(this, this.theme, null, false);
        textLabel.setSize(xSize, ySize);
    }

    void constructIcon(String dest) { 
        icon = new ShapeLabel(this, this.theme, dest, true);
        computeIconSize();
    }

    void constructIcon(PShape shape) { 
        icon = new ShapeLabel(this, this.theme, shape, true); 
        computeIconSize();
    }





    // █▀ █▀▀ ▀█▀ ▀█▀ █▀▀ █▀█ █▀
    // ▄█ ██▄ ░█░ ░█░ ██▄ █▀▄ ▄█

    
    @Override public void setTheme(UITheme theme) {
        super.setTheme(theme);
        visualFrame.setTheme(theme);
    }
    
    public void updateStylePack(FrameStyle[] stylePack) {
        visualFrame.updateStylePack(stylePack);
    }

    
    public void setSwitchState(boolean forced) {
        this.pressed = forced;
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
        
        UIState visualState = this.state;
        if (visualState != UIState.ACTIVATED) { // If the button is no longer being actively clicked on
            if (!toggleable) pressed = false; // If the button is not toggleable, just reset pressed back to false.
            else if (pressed) visualState = UIState.ACTIVATED; // If the button is toggleable, then force the visualState to be ACTIVATED until pressed is set to false by the onClick method.
        }

        // Communicate the current state of the Button to all of its subset visual elements
        UIElement[] children = childManager.getChildren();
        for (UIElement element : children) {
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

        // Render all of the linked visual elements, after their custom settings were applied
        for (UIElement child : children) {
            child.render();
        }

    }

}