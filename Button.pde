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

    // Visual Frame element
    VisualFrame visualFrame;
    TextLabel textLabel;
    ImageLabel icon; // TODO: Check how these icons behave with .svg files instead of normal image files.

    // Handle hierarchy with other UI elements as a container
    private final ChildManager childManager = new ChildManager();
    @Override public void addChild(UIElement child) { childManager.addChild(child); }
    @Override public void removeChild(UIElement child) { childManager.removeChild(child); }

    // Specific Button Logic
    Runnable onHover;
    Runnable onClick;



    // █▀▀ █▀█ █▄░█ █▀ ▀█▀ █▀█ █░█ █▀▀ ▀█▀ █▀█ █▀█
    // █▄▄ █▄█ █░▀█ ▄█ ░█░ █▀▄ █▄█ █▄▄ ░█░ █▄█ █▀▄

         // Hierarchy       // Style       // Render   // Positioning        // Size
    public Button(Container parent, UITheme theme, int zIndex, float xPos, float yPos, float xSize, float ySize) {
        super(parent, theme, zIndex, xPos, yPos, xSize, ySize);

        // Create a Visual Frame element that will act as the 'visible' part of the button
        visualFrame = new VisualFrame(
            parent, theme, 
            this.theme.button(UIState.DEFAULT), 
            this.theme.button(UIState.HOVERED), 
            this.theme.button(UIState.ACTIVATED), 
            this.theme.button(UIState.DISABLED), 
            0.0, 0.0, xSize, ySize);

        // Create a TextLabel that will handle the actual text
        // Container parent, UITheme theme, boolean hasVisualFrame, int zIndex, float xPos, float yPos, float xSize, float ySize

        // TODO: Make the creation of a TextLabel an optional thing that happens if and only if a label is 'applied' to the button
        // textLabel = new TextLabel(this, null, false, 1, 0, 0, xSize, ySize);

        // Explicitly mention that this is to be considered a 'child' of it's parent, and not a building block of the parent itself.
        this.parent.addChild(this);

        Events.hoverableElements.add(this);
        Events.clickableElements.add(this);
    }

    void constructTextLabel() { textLabel = new TextLabel(this, this.theme, false, 1, 0, 0, xSize, ySize); }
    void constructIcon(String dest) { icon = new ImageLabel(this, this.theme, 1, dest, 0, 0, ySize*0.62, ySize*0.62); }
    void constructIcon(PImage img) { icon = new ImageLabel(this, this.theme, 1, img, 0, 0, ySize*0.62, ySize*0.62); }



    // █▀ █▀▀ ▀█▀ ▀█▀ █▀▀ █▀█ █▀
    // ▄█ ██▄ ░█░ ░█░ ██▄ █▀▄ ▄█

    @Override void setTheme(UITheme theme) {
        super.setTheme(theme);
        visualFrame.setTheme(theme);
    }

    // Set new Runnables to be triggered onClick or onHover
    @Override void setOnClick(Runnable method) { this.onClick = method; }
    @Override void setOnHover(Runnable method) { this.onHover = method; }

    // TEXTLABEL SETTER FORWARDERS
    // All of these must first check if TextLabel has been constructed yet, and if not, then construct it themselves.
    void setContent(String s) { 
        if (textLabel == null ) constructTextLabel();
        textLabel.setContent(s);
        
    }

    void setTextSize(float s) { 
        if (textLabel == null ) constructTextLabel();
        textLabel.setTextSize(s);
    }

    // ICON SETTER FORWARDERS

    void setIcon(String dest) {
        if (icon == null) {
            constructIcon(dest);
        } else icon.setImage(dest);
    }

    void setIcon(PImage img) {
        if (icon == null) {
            constructIcon(img);
        } else icon.setImage(img);
    }

    

    // ▄▀█ █▀▀ ▀█▀ █ █▀█ █▄░█ █▀
    // █▀█ █▄▄ ░█░ █ █▄█ █░▀█ ▄█

    void mouseClicked() {
        if (onClick != null) onClick.run();
    }

    void mouseHovered() {
        if (onHover != null) onHover.run();
    }



    // █▀█ █▀▀ █▄░█ █▀▄ █▀▀ █▀█
    // █▀▄ ██▄ █░▀█ █▄▀ ██▄ █▀▄

    @Override void render() {

        // Communicate the current state of the Button to the VisualFrame and TextLabel and render them accordingly.
        visualFrame.setAnchorPoints(xAnchor,yAnchor);
        visualFrame.setAbsolute(xAbs,yAbs);
        visualFrame.setUIState(this.state);
        visualFrame.render();

        if (textLabel != null) {
            textLabel.setAnchorPoints(xAnchor,yAnchor);
            textLabel.setAbsolute(xAbs,yAbs);
            textLabel.setUIState(this.state);
            textLabel.render();
        }

        if (icon != null) {
            icon.setUIState(this.state); // Right now unused, but I don't want to worry about forgetting to implement this in the chain later down the line if I do implement states for ImageLabels.
            icon.setAnchorPoints(0.5, 0.5);
            icon.setPosition(xSize/2,ySize/2);
            icon.render();
        }

    }

}
