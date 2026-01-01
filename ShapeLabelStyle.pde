// package proact.theme


// █▀ █░█ ▄▀█ █▀█ █▀▀   █░░ ▄▀█ █▄▄ █▀▀ █░░   █▀ ▀█▀ █▄█ █░░ █▀▀
// ▄█ █▀█ █▀█ █▀▀ ██▄   █▄▄ █▀█ █▄█ ██▄ █▄▄   ▄█ ░█░ ░█░ █▄▄ ██▄

// Template & Constructor for the visuals of TextLabels


public class ShapeLabelStyle {

    // As mentioned previously, default values can be safely omitted from fields.

    // Whether or not it has a visual frame
    boolean fill;
    color fillColor;

    float strokeWeight;
    color strokeColor;
    
    
    ShapeLabelStyle(boolean fill, color fillColor, float strokeWeight, color strokeColor) {
        this.fill = fill;
        this.fillColor = fillColor;

        this.strokeWeight = strokeWeight;
        this.strokeColor = strokeColor;
    }

}