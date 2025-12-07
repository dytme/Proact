/*

███████╗██████╗░░█████╗░███╗░░░███╗███████╗░██████╗
██╔════╝██╔══██╗██╔══██╗████╗░████║██╔════╝██╔════╝
█████╗░░██████╔╝███████║██╔████╔██║█████╗░░╚█████╗░
██╔══╝░░██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝░░░╚═══██╗
██║░░░░░██║░░██║██║░░██║██║░╚═╝░██║███████╗██████╔╝
╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝╚══════╝╚═════╝░

Containers that can hold other elements

*/

class Frame {

    // Positioning Fields
    float xAbs, yAbs, xPos, yPos;
    float xSize, ySize;
    float xAnchor, yAnchor;

    // Rendering Fields
    UITheme theme;
    int zIndex;
    boolean visible;
    
    // Event Fields
    Runnable onClick;
    Runnable onHover;
    Runnable onDrag;

    
    Frame(float xPos, float yPos){
        this.xPos = xPos;
        this.yPos = yPos;
    }
}