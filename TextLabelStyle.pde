// package proact.theme


// ▀█▀ █▀▀ ▀▄▀ ▀█▀   █░░ ▄▀█ █▄▄ █▀▀ █░░   █▀ ▀█▀ █▄█ █░░ █▀▀
// ░█░ ██▄ █░█ ░█░   █▄▄ █▀█ █▄█ ██▄ █▄▄   ▄█ ░█░ ░█░ █▄▄ ██▄

// Template & Constructor for the visuals of TextLabels


public class TextLabelStyle {

    // As mentioned previously, default values can be safely omitted from fields.

    // Whether or not it has a visual frame
    FrameStyle visualFrameStyle;

    // Content
    color textColor;
    float textTransparency;
    
    TextLabelStyle(FrameStyle visualFrameStyle, color textColor, float textTransparency) {

        this.visualFrameStyle = visualFrameStyle;

        this.textColor = textColor;
        this.textTransparency = textTransparency;

    }

}