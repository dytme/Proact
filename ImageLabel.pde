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

    ImageLabel(Container parent, UITheme theme, PImage img) {
        super(parent, theme, 1, 0, 0, 100, 100);
        this.img = img;

        this.parent.addChild(this);
    }

    ImageLabel(Container parent, UITheme theme, String filePath) {
        super(parent, theme, 1, 0, 0, 100, 100);
        this.destination = filePath;
        this.img = loadImage(filePath);

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