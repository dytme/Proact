// package proact.utilities


// █▀█ █▀▀ █▄░█ █▀▄ █▀▀ █▀█   █▀▀ █▄░█ █▀▀ █ █▄░█ █▀▀
// █▀▄ ██▄ █░▀█ █▄▀ ██▄ █▀▄   ██▄ █░▀█ █▄█ █ █░▀█ ██▄

ArrayList<UIRoot> UIRoots = new ArrayList<>();

void proactDrawLoop() {
    
    // Render UI Loop

    for (UIRoot root : UIRoots) {
        if (root.visible) root.render();
    }

    // EVENT HANDLING

    // Reset all hovered elements from the previous round until proven otherwise
    for (Hoverable element : Events.hoverableElements) {
        if (element.getUIState() == UIState.HOVERED) element.setUIState(UIState.DEFAULT);
    }

    // Check if an element is actually being hovered over.
    for (Hoverable element : Events.hoverableElements) {
        if (element.isMouseOver(mouseX, mouseY)) {
            if (element.getUIState() == UIState.DEFAULT) element.setUIState(UIState.HOVERED); // Only apply the style if the state of the button is default (other states like ACTIVATED through clicking take priority here)
            return; // Not break, to only stop this method and not the entire draw loop.
        } else element.setUIState(UIState.DEFAULT); // Also added here to facilitate MouseLeave() like behavior.
    }

}




// █▀█ █▀█ █▀█ ▄▀█ █▀▀ ▀█▀   █▀▀ █░█ █▀▀ █▄░█ ▀█▀   █░█ ▄▀█ █▄░█ █▀▄ █░░ █▀▀ █▀█ █▀
// █▀▀ █▀▄ █▄█ █▀█ █▄▄ ░█░   ██▄ ▀▄▀ ██▄ █░▀█ ░█░   █▀█ █▀█ █░▀█ █▄▀ █▄▄ ██▄ █▀▄ ▄█

// Logic that runs whenever an event handler is triggered.
// These *MUST* be connected to the actual event handlers within the Processing sketch.


// Check if an element is clicked when the mouse is being pressed
// cx: mouseX // cy: mouseY
void proactMousePressed(float cx, float cy) {
    for (Clickable element : Events.clickableElements) {
        if (element.isClicked(cx, cy)) { 
            println(element + " has been clicked!"); 
            element.setUIState(UIState.ACTIVATED);
            return;
        }
    }

    testLabel.setUIState(UIState.DISABLED);
}


// Once the mouse button is released, reset all activated elements to their default state
void proactMouseReleased() {
    for (Clickable element : Events.clickableElements) {
        if (element.getUIState() == UIState.ACTIVATED) element.setUIState(UIState.DEFAULT);
    }

    testLabel.setUIState(UIState.DEFAULT);
}


// TODO: Implement this
void proactMouseDragged() {

}