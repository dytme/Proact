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




// █▀ ▀█▀ ▄▀█ ▀█▀ █▀▀   █▀▀ █▄░█ █░█ █▀▄▀█ █▀
// ▄█ ░█░ █▀█ ░█░ ██▄   ██▄ █░▀█ █▄█ █░▀░█ ▄█

// What states can a UI element have?

enum UIState {
    DEFAULT,     // Basically Default, but I wanted to avoid confusion with the DefaultTheme
    HOVERED,    // When a cursor or mouse is on top of the element
    ACTIVE,     // When the element is pressed/dragged/actively messed around with
    DISABLED,   // When interactions are disabled with the element
}





// █▀▀ █░░ ▄▀█ █▀ █▀   █▀█ █▄▄ ░░█ █▀▀ █▀▀ ▀█▀ █▀
// █▄▄ █▄▄ █▀█ ▄█ ▄█   █▄█ █▄█ █▄█ ██▄ █▄▄ ░█░ ▄█

// Class Objects that need to be referenced globally

UITheme DefaultTheme = new DefaultThemeClass();
// UITheme DarkTheme = new DarkThemeClass();


// █▀ █▀▀ ▀█▀ █░█ █▀█
// ▄█ ██▄ ░█░ █▄█ █▀▀


void setup() {
    size(400,400);
}

void draw() {
    println("tick");
    delay(1000);
}





// █▀█ █▀▀ █▄░█ █▀▄ █▀▀ █▀█   █▀▀ █▄░█ █▀▀ █ █▄░█ █▀▀
// █▀▄ ██▄ █░▀█ █▄▀ ██▄ █▀▄   ██▄ █░▀█ █▄█ █ █░▀█ ██▄

ArrayList<UIElement> UIElements = new ArrayList<>();

void renderUI() {
    for (UIElement element : UIElements) {
        println(element + " : " + element.visible);
    }
}
