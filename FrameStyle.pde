// package proact.themes


// █▀▀ █▀█ ▄▀█ █▀▄▀█ █▀▀   █▀ ▀█▀ █▄█ █░░ █▀▀
// █▀░ █▀▄ █▀█ █░▀░█ ██▄   ▄█ ░█░ ░█░ █▄▄ ██▄

// Template & Constructor for the visual style of Frames (under different states)


public class FrameStyle {

    // There are some pre-included values here, but keep in mind that these do not necessarily act as defaults.
    // They are here just to show examples of values that you can attribute.

    // Background
    color backgroundColor = #D9D9D9;
    float backgroundTransparency = 0;
    int cornerRadius = 4;

    // Stroke
    float strokeWeight = 1;
    color strokeColor = #000000;
    float strokeTransparency = 0;
    
    FrameStyle(color backgroundColor, float backgroundTransparency, int cornerRadius, color strokeColor, float strokeTransparency, float strokeWeight) {

        this.backgroundColor = backgroundColor;
        this.backgroundTransparency = backgroundTransparency;
        this.cornerRadius = cornerRadius;

        this.strokeColor = strokeColor;
        this.strokeTransparency = strokeTransparency;
        this.strokeWeight = strokeWeight;

    }

}

