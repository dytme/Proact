// Test element that shows how to create a custom UI element outside of the library itself

// /*

// ░██████╗██╗░░░░░██╗██████╗░███████╗██████╗░
// ██╔════╝██║░░░░░██║██╔══██╗██╔════╝██╔══██╗
// ╚█████╗░██║░░░░░██║██║░░██║█████╗░░██████╔╝
// ░╚═══██╗██║░░░░░██║██║░░██║██╔══╝░░██╔══██╗
// ██████╔╝███████╗██║██████╔╝███████╗██║░░██║
// ╚═════╝░╚══════╝╚═╝╚═════╝░╚══════╝╚═╝░░╚═╝

// Element that can be dragged in order to fine-tune a value.

// */


public class Slider extends UIElement implements Container, Hoverable, Clickable, Draggable {

    // Logic Fields
    double minValue = 0;
    double maxValue = 100;

    double currentValue;
    int decimalPoints;

    // Specific Button Logic
    Runnable onHover;
    Runnable onClick;

    // Handle hierarchy with other UI elements as a container
    private final ChildManager childManager = new ChildManager();
    @Override public void addChild(UIElement child) { childManager.addChild(child); }
    @Override public void removeChild(UIElement child) { childManager.removeChild(child); }




    // █▀▀ █▀█ █▄░█ █▀ ▀█▀ █▀█ █░█ █▀▀ ▀█▀ █▀█ █▀█
    // █▄▄ █▄█ █░▀█ ▄█ ░█░ █▀▄ █▄█ █▄▄ ░█░ █▄█ █▀▄


    public Slider(Container parent, UITheme theme, double minValue, double maxValue) {
        super(parent, theme, 0, 0, 0, 100, 10);

        this.minValue = minValue;
        this.maxValue = maxValue;

        // Explicitly mention that this is to be considered a 'child' of it's parent, and not a building block of the parent itself.
        this.parent.addChild(this);

        Events.registerToHoverable(this);
        Events.registerToClickable(this);
    }




    // █▀ █▀▀ ▀█▀ ▀█▀ █▀▀ █▀█ █▀
    // ▄█ ██▄ ░█░ ░█░ ██▄ █▀▄ ▄█


    // public void updateStylePack(FrameStyle[] stylePack) {
    //     // TODO: Implement Style Pack Changes
    // }


    // Set new Runnables to be triggered onClick or onHover
    @Override void setOnClick(Runnable method) { this.onClick = method; }
    @Override void setOnHover(Runnable method) { this.onHover = method; }


    // Update Slider-Specific Values
    public void setMinValue(double newMinValue) { this.minValue = newMinValue; }
    public void setMaxValue(double newMaxValue) { this.minValue = newMaxValue; }

    public void setIncrementUnit(int unit) { this.decimalPoints = unit; } // Up to how many decimals does currentValue round off to?
                                                                           // It's missnamed as this variable had different behaviour planned for it.

    double roundValue(double newValue) { 
        // double roundingFactor = Math.pow(10, decimalPoints);
        return Math.round(newValue/decimalPoints) * decimalPoints;
    }

    public void onDrag(float cx, float cy) {
        if (cx < this.xAbs) {
            currentValue = minValue; // If the mouse is outside of the bounds of the slider, set it's value to the minimum or maximum.
        } else if (cx > this.xAbs + this.xSize) {
            currentValue = maxValue;
        } else { // Otherwise, map the difference between the mouse X and absolute X.
                 // Then round the result and update currentValue
            currentValue = roundValue(map(
                cx, 
                this.xAbs, 
                this.xAbs + this.xSize,
                (float) this.minValue,
                (float) this.maxValue
            ));
        }
    }
    



    // █▀▀ █▀▀ ▀█▀ ▀█▀ █▀▀ █▀█ █▀
    // █▄█ ██▄ ░█░ ░█░ ██▄ █▀▄ ▄█

    public double getCurrentValue() { return currentValue; }
    public double getMinValue() { return minValue; }
    public double getMaxValue() { return maxValue; }

    



    // ▄▀█ █▀▀ ▀█▀ █ █▀█ █▄░█ █▀
    // █▀█ █▄▄ ░█░ █ █▄█ █░▀█ ▄█

    void mouseClicked() {
        this.state = UIState.ACTIVATED;
        if (onClick != null) onClick.run();
    }

    void mouseHovered() {
        if (onHover != null) onHover.run();
    }



    // █▀█ █▀▀ █▄░█ █▀▄ █▀▀ █▀█
    // █▀▄ ██▄ █░▀█ █▄▀ ██▄ █▀▄

    @Override void render() {

        // Communicate the current state of the Button to all of its subset visual elements
        UIElement[] children = childManager.getChildren();

        if (this == Events.focusedElement) {
            // print("Slider " + this + " is the currently focused element.");
            // TODO: While this happens, compute a new currentValue through the mouse position.
        }

        // Draw the slider bar
        fill(#68686C);
        applet.rect(
            this.xAbs,
            this.yAbs + this.ySize/2 -1,
            this.xSize,
            2,
            2
        );

        // Draw the draggable object
        fill(#FFFFFF);
        applet.rect(
            map( (float) currentValue, (float) minValue, (float) maxValue, xAbs, xAbs+xSize) - 2,
            this.yAbs,
            5,
            this.ySize,
            1
        );

        // Render all of the linked visual elements, after their custom settings were applied
        for (UIElement child : children) {
            child.render();
        }

    }

}