/*

                                           █
          █░░ █ █▀▄▀█ █ ▀█▀ █░░ █▀▀ █▀ █▀  █  ██████╗░██████╗░░█████╗░░█████╗░░█████╗░████████╗
          █▄▄ █ █░▀░█ █ ░█░ █▄▄ ██▄ ▄█ ▄█  █  ██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝
                                           █  ██████╔╝██████╔╝██║░░██║███████║██║░░╚═╝░░░██║░░░
█ █▄░█ ▀█▀ █▀▀ █▀█ ▄▀█ █▀▀ ▀█▀ █ █▀█ █▄░█  █  ██╔═══╝░██╔══██╗██║░░██║██╔══██║██║░░██╗░░░██║░░░
█ █░▀█ ░█░ ██▄ █▀▄ █▀█ █▄▄ ░█░ █ █▄█ █░▀█  █  ██║░░░░░██║░░██║╚█████╔╝██║░░██║╚█████╔╝░░░██║░░░
                                           █  ╚═╝░░░░░╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝░╚════╝░░░░╚═╝░░░

Version 2.0 Alpha

*/




import processing.core.PApplet;



// █▀▀ █░░ ▄▀█ █▀ █▀   █▀█ █▄▄ ░░█ █▀▀ █▀▀ ▀█▀ █▀
// █▄▄ █▄▄ █▀█ ▄█ ▄█   █▄█ █▄█ █▄█ ██▄ █▄▄ ░█░ ▄█

// Class Objects that need to be referenced globally

UITheme DefaultTheme;
// UITheme DarkTheme = new DarkThemeClass();



// █▀ █▀▀ ▀█▀ █░█ █▀█
// ▄█ ██▄ ░█░ █▄█ █▀▀

UIRoot proactRoot;

void setup() {
    // OPT: Set Canvas Size
    size(600,600);
    pixelDensity(1); // Optional, for my monitor.

    // Initialize the Default Theme + Any other theme you'd like
    proactSetup();

    devTestSetupMethod();
}

void draw() {
    
    background(#FFBB00);
    proactDrawLoop(this);

    devTestDrawMethod();

    // delay(500);

}



// █▀▀ █░█ █▀▀ █▄░█ ▀█▀   █░█ ▄▀█ █▄░█ █▀▄ █░░ █▀▀ █▀█   █▀▀ █▀█ █▄░█ █▄░█ █▀▀ █▀▀ ▀█▀ █ █▀█ █▄░█ █▀
// ██▄ ▀▄▀ ██▄ █░▀█ ░█░   █▀█ █▀█ █░▀█ █▄▀ █▄▄ ██▄ █▀▄   █▄▄ █▄█ █░▀█ █░▀█ ██▄ █▄▄ ░█░ █ █▄█ █░▀█ ▄█

void mousePressed() {
    proactMousePressed(mouseX, mouseY);
}


void mouseReleased() {
    proactMouseReleased();
}