// package proact.ui

/*

██╗███╗░░░███╗░█████╗░░██████╗░███████╗    ██╗░░░░░░█████╗░██████╗░███████╗██╗░░░░░
██║████╗░████║██╔══██╗██╔════╝░██╔════╝    ██║░░░░░██╔══██╗██╔══██╗██╔════╝██║░░░░░
██║██╔████╔██║███████║██║░░██╗░█████╗░░    ██║░░░░░███████║██████╦╝█████╗░░██║░░░░░
██║██║╚██╔╝██║██╔══██║██║░░╚██╗██╔══╝░░    ██║░░░░░██╔══██║██╔══██╗██╔══╝░░██║░░░░░
██║██║░╚═╝░██║██║░░██║╚██████╔╝███████╗    ███████╗██║░░██║██████╦╝███████╗███████╗
╚═╝╚═╝░░░░░╚═╝╚═╝░░╚═╝░╚═════╝░╚══════╝    ╚══════╝╚═╝░░╚═╝╚═════╝░╚══════╝╚══════╝

Basically a PImage but with relative positioning and zIndex support.

*/

public class ImageLabel extends UIElement {
    String destination;
    PImage img;

    ImageLabel(Container parent, UITheme theme, int zIndex, PImage img, float xPos, float yPos, float xSize, float ySize) {
        super(parent, theme, zIndex, xPos, yPos, xSize, ySize);
        this.img = img;

        this.parent.addChild(this);
    }

    ImageLabel(Container parent, UITheme theme, int zIndex, String dest, float xPos, float yPos, float xSize, float ySize) {
        super(parent, theme, zIndex, xPos, yPos, xSize, ySize);
        this.destination = dest;
        this.img = loadImage(dest);

        if (img == null) {
            throw new IllegalArgumentException("Image parented to " + parent + " could not be constructed.");
        }

        this.parent.addChild(this);
    }

    public void setImage(PImage i) {
        this.img = i;
    }

    public void setImage(String dest) {
        this.destination = dest;
        this.img = loadImage(dest);
    }

    void render() {
        applet.image(img, xAbs, yAbs, xSize, ySize);
    }
}