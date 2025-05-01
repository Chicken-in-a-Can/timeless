use crate::graphics::render;

enum State {
    RUNNING,
    MINIMIZED,
    CLOSED,
}

pub struct Scene {
    name: String,
    state: State,
}

impl Scene {
    pub fn new(name: String) -> Self {
        return Self {
            name,
            state: State::CLOSED,
        };
    }
}
