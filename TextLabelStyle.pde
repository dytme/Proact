// package proact.theme


// ▀█▀ █▀▀ ▀▄▀ ▀█▀   █░░ ▄▀█ █▄▄ █▀▀ █░░   █▀ ▀█▀ █▄█ █░░ █▀▀
// ░█░ ██▄ █░█ ░█░   █▄▄ █▀█ █▄█ ██▄ █▄▄   ▄█ ░█░ ░█░ █▄▄ ██▄

// Template & Constructor for the visuals of TextLabels


public class TextLabelStyle {

    // As mentioned previously, default values can be safely omitted from fields.

    // StylePack for the VisualFrame (if it has one)
    FrameStyle[] visualFrameStylePack;

    // Content
    float textSize;
    color textColor;
    
    PFont fontStyle;
    float textTransparency;
    
    TextLabelStyle(FrameStyle[] visualFrameStylePack, float textSize, color textColor, PFont fontStyle, float textTransparency) {

        this.visualFrameStylePack = visualFrameStylePack;

        this.textSize = textSize;

        this.textColor = textColor;
        this.fontStyle = fontStyle;

        this.textTransparency = textTransparency;

    }

}