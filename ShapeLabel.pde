// package proact.ui

/*

░██████╗██╗░░██╗░█████╗░██████╗░███████╗    ██╗░░░░░░█████╗░██████╗░███████╗██╗░░░░░
██╔════╝██║░░██║██╔══██╗██╔══██╗██╔════╝    ██║░░░░░██╔══██╗██╔══██╗██╔════╝██║░░░░░
╚█████╗░███████║███████║██████╔╝█████╗░░    ██║░░░░░███████║██████╦╝█████╗░░██║░░░░░
░╚═══██╗██╔══██║██╔══██║██╔═══╝░██╔══╝░░    ██║░░░░░██╔══██║██╔══██╗██╔══╝░░██║░░░░░
██████╔╝██║░░██║██║░░██║██║░░░░░███████╗    ███████╗██║░░██║██████╦╝███████╗███████╗
╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚══════╝    ╚══════╝╚═╝░░╚═╝╚═════╝░╚══════╝╚══════╝

Similar to ImageLabel, but instead of an image, it allows users to add .SVG files in their UIs
Can be state-driven

*/

public class ShapeLabel extends UIElement {
    
    // References for the shape file
    String destination;
    PShape shape;

    // !! Without useStateDrivenStyling activated, none of these shared or state-driven settings will actually apply.
    boolean useStateDrivenStyling = false;

    ShapeLabelStyle shapeLabelDefault = theme.shapeLabel(UIState.DEFAULT);
    ShapeLabelStyle shapeLabelHovered = theme.shapeLabel(UIState.HOVERED);
    ShapeLabelStyle shapeLabelActivated = theme.shapeLabel(UIState.ACTIVATED);
    ShapeLabelStyle shapeLabelDisabled = theme.shapeLabel(UIState.DISABLED);
    
    ShapeLabelStyle currentStyle = shapeLabelDefault;



    // Constructors
    ShapeLabel(Container parent, UITheme theme, PShape shape, boolean useStateDrivenStyling) {
        super(parent, theme, 1, 0, 0, 100, 100);
        this.shape = shape;

        this.useStateDrivenStyling = useStateDrivenStyling;

        this.parent.addChild(this);
    }

    ShapeLabel(Container parent, UITheme theme, String filePath, boolean useStateDrivenStyling) {
        super(parent, theme, 1, 0, 0, 100, 100);
        this.destination = filePath;
        this.shape = loadShape(filePath);

        if (shape == null) {
            throw new IllegalArgumentException("Shape parented to " + parent + " could not be constructed.");
        }

        this.useStateDrivenStyling = useStateDrivenStyling;

        this.parent.addChild(this);
    }



    // Set the object's theme.
    @Override public void setTheme(UITheme theme) {
        super.setTheme(theme);

        shapeLabelDefault = theme.shapeLabel(UIState.DEFAULT);
        shapeLabelHovered = theme.shapeLabel(UIState.HOVERED);
        shapeLabelActivated = theme.shapeLabel(UIState.ACTIVATED);
        shapeLabelDisabled = theme.shapeLabel(UIState.DISABLED);
    }

    // If the shape will use state-driven styling or not.
    public void useStateDrivenStyling(boolean b) { useStateDrivenStyling = b; } 

    // Setters that change the actual shaped linked to this object.
    public void setShape(PShape s) { this.shape = s; }
    public void setShape(String dest) { this.destination = dest; } // File destination for the .SVG file



    void render() {

        if (shape == null) throw new IllegalArgumentException("Shape " + shape + " has not been constructed properly and is trying to render.");

        // If the shape is using state-driven styling, then update all of the visual properties of the applet
        if (useStateDrivenStyling) {

            shape.disableStyle(); // Allow the style of the shape to be overwritten

            // Update current style based on the newly applied state (if any)
            if (this.state != null) { 
                switch (this.state) {
                case HOVERED:
                    currentStyle = shapeLabelHovered;
                    break;
                case ACTIVATED:
                    currentStyle = shapeLabelActivated;
                    break;
                case DISABLED:
                    currentStyle = shapeLabelDisabled;
                    break;
                default:
                    currentStyle = shapeLabelDefault;
                    break;
                }
            }

            // If the icon is not supposed to be filled, force the fill to be a completely transparent color
            if (currentStyle.fill) { 
                applet.fill(currentStyle.fillColor);
            } else applet.fill(#00000000);

            applet.strokeWeight(currentStyle.strokeWeight);
            applet.stroke(currentStyle.strokeColor);

        } else shape.enableStyle(); // Reactivate the defaults of the shape's style.

        // Draw the actual shape, either with the state-driven settings or its default ones.
        applet.shape(this.shape, xAbs, yAbs, xSize, ySize);
    }
    
}